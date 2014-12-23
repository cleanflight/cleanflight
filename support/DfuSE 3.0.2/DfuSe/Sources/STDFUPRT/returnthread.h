#ifndef _RETURN_THREAD_H_
#define _RETURN_THREAD_H_

#define SPECIAL_COMMAND_GO_TO_DNLOAD_IDLE	0xFFFC

class CReturnThread : public CDFUThread {
public:
	CReturnThread(PDFUThreadContext pContext);
	virtual ~CReturnThread();

private:
	virtual	BOOL	RunThread();
};
#endif
