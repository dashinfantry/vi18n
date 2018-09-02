#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#include<QCoreApplication>
#include <sailfishapp.h>
#include "vi18n/vi18n.h"
#include <QDebug>

int main(int argc, char *argv[])
{

    QScopedPointer<QGuiApplication> app(SailfishApp::application(argc, argv));

    QScopedPointer<QQuickView> view(SailfishApp::createView());

    // init v18n : set service, load data, set to user locale
    vI18n::init(view->rootContext());

    // some cpp examples
    qDebug() << "****************************************************";
    QList<QString> available = VI18N.getAvailableLanguage();
    qDebug() << "Available laguages(s) : " << available.length();

    foreach (QString str,available) {
        qDebug() << "lng : " << str;
    }
    qDebug() << "\n";
    qDebug() << "value for key \"list.title\", default language: " << VI18N.get("hello");
    qDebug() << "value for key \"list.title\", in suomi : " << VI18N.get("hello", "fi");

    // you must init v18n before calling any qml
    view->setSource(SailfishApp::pathTo("qml/harbour-testvi18n.qml"));
    view->show();

    return app->exec();
}

