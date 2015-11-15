#include <qapplication.h>
#include <qprocess.h>
#include <qdir.h>

extern "C" void systemReset( ){
	QString exe = QApplication::applicationFilePath();

	QProcess::startDetached( exe , QStringList() , QDir::currentPath() );
	exit(0);
}

extern "C" void systemResetToBootloader( ){
	systemReset();
}

