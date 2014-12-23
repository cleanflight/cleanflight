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

#if !defined(AFX_TEXTPROGRESSCTRL_H__4C78DBBE_EFB6_11D1_AB14_203E25000000__INCLUDED_)
#define AFX_TEXTPROGRESSCTRL_H__4C78DBBE_EFB6_11D1_AB14_203E25000000__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

// TextProgressCtrl.h : header file

/////////////////////////////////////////////////////////////////////////////
// CTextProgressCtrl window

class CTextProgressCtrl : public CProgressCtrl
{
// Construction
public:
	CTextProgressCtrl();

// Attributes
public:

// Operations
public:
    int			SetPos(int nPos);
    int			StepIt();
    void		SetRange(int nLower, int nUpper);
    int			OffsetPos(int nPos);
    int			SetStep(int nStep);
	void		SetForeColour(COLORREF col);
	void		SetBkColour(COLORREF col);
	void		SetTextForeColour(COLORREF col);
	void		SetTextBkColour(COLORREF col);
	COLORREF	GetForeColour();
	COLORREF	GetBkColour();
	COLORREF	GetTextForeColour();
	COLORREF	GetTextBkColour();

    void		SetShowText(BOOL bShow);

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTextProgressCtrl)
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CTextProgressCtrl();

	// Generated message map functions
protected:
    int			m_nPos, 
				m_nStepSize, 
				m_nMax, 
				m_nMin;
    CString		m_strText;
    BOOL		m_bShowText;
    int			m_nBarWidth;
	COLORREF	m_colFore,
				m_colBk,
				m_colTextFore,
				m_colTextBk;

	//{{AFX_MSG(CTextProgressCtrl)
	afx_msg BOOL OnEraseBkgnd(CDC* pDC);
	afx_msg void OnPaint();
	afx_msg void OnSize(UINT nType, int cx, int cy);
	//}}AFX_MSG
    afx_msg LRESULT OnSetText(WPARAM wParam, LPARAM lParam);//(UINT, LPCTSTR szText);
    afx_msg LRESULT OnGetText(WPARAM wParam, LPARAM lParam);//(UINT cchTextMax, LPTSTR szText);

	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TEXTPROGRESSCTRL_H__4C78DBBE_EFB6_11D1_AB14_203E25000000__INCLUDED_)
