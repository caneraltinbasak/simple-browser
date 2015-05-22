#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWebEngine/qtwebengineglobal.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QtWebEngine::initialize();


    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (argc > 1)
    {
        QMetaObject::invokeMethod(engine.rootObjects().first(), "load", Q_ARG(QVariant, argv[1]));
    }
    else
    {
        QMetaObject::invokeMethod(engine.rootObjects().first(), "load", Q_ARG(QVariant, "http://www.google.com"));
    }

    return app.exec();
}
