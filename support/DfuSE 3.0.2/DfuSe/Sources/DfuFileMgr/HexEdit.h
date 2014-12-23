/******************** (C) COPYRIGHT 2011 STMicroelectronics ********************
* Company            : STMicroelectronics
* Author             : MCD Application Team
* Description        : STMicroelectronics Device Firmware Upgrade Extension Demo
* Version            : V3.0.2
* Date               : 09-May-2011
********************************************************************************
* THE PRESENT SOFTWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
* WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE TIME.
* AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY DIRECT,
* INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING FROM THE
* CONTENT OF SUCH SOFTWARE AND/OR THE USE MADE BY CUSTOMERS OF THE CODING
* INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
*******************************************************************************/


#if !defined(AFX_HEXEDIT_H__52939FC1_17E0_467F_8AE8_6A0E367FB5F3__INCLUDED_)
#define AFX_HEXEDIT_H__52939FC1_17E0_467F_8AE8_6A0E367FB5F3__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// HexEdit.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CHexEdit window
struct TextColor {
		COLORREF clrTextColor;
		COLORREF clrBkColor;
};
class CHexEdit : public CEdit
{
// Construction
public:
	CHexEdit();

// Attributes
public:

protected:
	TextColor m_icHexText;
	TextColor m_icDecText;
private:
	bool m_bEnd;
	bool m_bHex;

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CHexEdit)
	public:
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CHexEdit();

	// Generated message map functions
protected:
	//{{AFX_MSG(CHexEdit)
	afx_msg HBRUSH CtlColor(CDC* pDC, UINT nCtlColor);
	afx_msg void OnChar(UINT nChar, UINT nRepCnt, UINT nFlags);
//	afx_msg void OnChange();
	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()
public:
protected:
	virtual void DoDataExchange(CDataExchange* pDX);
public:
	virtual BOOL OnCommand(WPARAM wParam, LPARAM lParam);
	afx_msg void OnContextMenu(CWnd* /*pWnd*/, CPoint /*point*/);
private:
	CBrush m_bkDecBrush;//background dec color brush
	CBrush m_bkHexBrush;//background hex color brush
	bool IsHexConvertableText(LPTSTR _text);
	void FormatClipboard();
public:
	void SetHexColor(COLORREF clrBack, COLORREF clrText);
	void SetDecColor(COLORREF clrBack, COLORREF clrText);
	afx_msg void OnEnUpdate();
	afx_msg LRESULT OnConvert(WPARAM wParam, LPARAM lParam);
	unsigned int GetValue(void);
	void SetValue(unsigned int _value,bool _bHex=false);
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_HEXEDIT_H__52939FC1_17E0_467F_8AE8_6A0E367FB5F3__INCLUDED_)
