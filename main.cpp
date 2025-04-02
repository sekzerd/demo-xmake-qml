#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QLoggingCategory>
#include <QtDebug>
int main(int argc, char* argv[]) {
    qInfo() << "Hello World";
    
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    // Q_INIT_RESOURCE(qrc_qml);

    QQmlApplicationEngine engine;
    engine.addImportPath("qrc:/");
    engine.setOutputWarningsToStandardError(true);
    QLoggingCategory::setFilterRules("qt.qml.binding.removal.info=true");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreated, &app,
        [url](QObject* obj, const QUrl& objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
