#include <qmainwindow.h>
#include <qtimer.h>
#include <Ui_cMainWindow.h>


class cMainWindow : public QMainWindow{
Q_OBJECT
public:
    Ui_cMainWindow ui;
	QTimer serial_timer;

    cMainWindow();
    ~cMainWindow();

	void update_serial();

public slots:
    void toggle_leds( int id , int direction );
};
