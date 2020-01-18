from app import create_app
import threading
from app.main.routes import detect_motion
from app.main import settings

if __name__ == '__main__':
    settings.init()  # initializing global variables
    print("Initialized +++++++++++++++++")
    print(settings.lock)
    # start a thread that will perform motion detection
    t = threading.Thread(target=detect_motion, args=(32,))
    t.daemon = True
    t.start()

    app = create_app()
    app.config['UPLOAD_FOLDER'] = '/home/shravan/Documents/repos/gallery/dotmole/dotmole/data/people'
    app.config['MAX_CONTENT_LENGTH'] = 16 * 1024 * 1024
    app.run(host="127.0.0.1", port="5000", debug=True,
            threaded=True, use_reloader=False)

settings.vs.stop()
