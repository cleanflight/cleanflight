#include <qapplication.h>
#include <qprocess.h>
#include <qdir.h>

extern "C"{
	#include "platform.h"
	#include "drivers/gpio.h"
	#include "drivers/exti.h"
	#include "drivers/system.h"
}


void systemReset( ){
	QString exe = QApplication::applicationFilePath();

	QProcess::startDetached( exe , QStringList() , QDir::currentPath() );
	exit(0);
}


void systemResetToBootloader( ){
	systemReset();
}

