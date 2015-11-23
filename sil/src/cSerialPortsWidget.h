#include <qtreewidget.h>
#include <qcombobox.h>
#include <qtimer.h>

class cSerialPortsWidget : public QTreeWidget{
public:
	cSerialPortsWidget( QWidget* parent=0 );
	~cSerialPortsWidget( );

private:
	struct Port{
		int              index;
		QString          name;
		QTreeWidgetItem* item;
		QComboBox*       cb;
	};

	QTimer      timer;
	QList<Port> ports;

	void add        ( QString name );
	void refresh    ( );
};
