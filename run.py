from app import create_app

#初始化app
app = create_app()

if __name__ == "__main__":
    app.run(debug=True)
