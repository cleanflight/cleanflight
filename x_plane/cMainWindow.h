#include <qmainwindow.h>
#include <Ui_cMainWindow.h>

class cMainWindow : public QMainWindow{
Q_OBJECT
public:
    Ui_cMainWindow ui;

    cMainWindow();
    ~cMainWindow();

public slots:
    void toggle_leds( int id , int direction );
};
