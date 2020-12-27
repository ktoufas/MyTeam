#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlContext>
#include "mediator.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    Mediator medt;
    engine.rootContext()->setContextProperty("medt",&medt);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
