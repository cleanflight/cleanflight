#include <qwidget.h>

class cLcdDisplay : public QWidget{
public:
	cLcdDisplay( QWidget* parent=0 );

	void put( int x , int y , char ch );

private:
	std::vector<char> buf;
	void paintEvent( QPaintEvent* ) override;
};
