#include <iostream>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "Polinom.h"

using std::cout;
using std::cin;
using std::endl;

int main(int argc, char *argv[]) {

    Polinom a(2, {-7, 4, 2});
    Polinom b(3, {1, 1, -3, 4});
    a.printPol();
    b.printPol();

    //!before each action, re-declare the variable (for each action - new variable)
    Polinom res = a+b;
    res.printPol();

    Polinom c = a-b;
    c.printPol();

    Polinom d = a*b;
    d.printPol();
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
//    QQuickStyle::setStyle("Material");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();

    return 0;
}
