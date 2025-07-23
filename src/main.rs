use axum::{
    routing::get,
    Router,

};
use axum::response::Html;

#[tokio::main]
async fn main() {
    // build our application with a single route
    let app = Router::new()
        .route("/", get(|| async { Html("Üdvözöllek a főoldalon!") }));

    let port = std::env::var("PORT").unwrap_or("8080".to_string());


    // run our app with hyper, listening globally on port 3000
    let listener = tokio::net::TcpListener::bind(format!("0.0.0.0:{}", port)).await.unwrap();
    axum::serve(listener, app).await.unwrap();
}