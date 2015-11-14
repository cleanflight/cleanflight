#include <qwidget.h>
#include <qtimer.h>

class cLcdDisplay : public QWidget{
public:
	cLcdDisplay( QWidget* parent=0 );

	void put( int x , int y , char ch );
	void clear( );

private:
	std::vector<char> buf;
	int               scale;
	bool              updated;
	QTimer            timer;

	void validate();
	void paintEvent( QPaintEvent* ) override;
};
