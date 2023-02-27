      *>***************************************************************
      *>                                                             **
      *> AUTHOR:       JONAS HOLM                                    **
      *>               Copyright (C) 2023, Jonas Holm                **
      *>                                                             **
      *> DATE-WRITTEN: 2023-02-27                                    **
      *>                                                             **
      *> DESCRIPTION:                                                **
      *> A subrutine to search customer.                             **
      *>***************************************************************
      *>  DATE  CHANGE DESCRIPTION                                   **
      *> ====== ==================================================== **
      *> 230227 Created.                                             **
      *>***************************************************************
       Identification Division.
         Program-Id.   SUB230.

       Data Division.
         Working-Storage Section.
           01 WS-CUST-DAT.
             05 CUSTID    Pic X(6)  Value Space.
             05 CUSTNAME  Pic X(20) Value Space.
             05 CUSTPHN1  Pic X(10) Value Space.
             05 CUSTPHN2  Pic X(10) Value Space.
           01 WS-RETVAL   Pic X(2)  Value Space.
           01 WS-INPKEY   Pic X     Value Space.
           01 WS-STATUS   Pic X(30) Value Space.

         Screen Section.
           01 SS-SEARCH-CUST-1.
             05 Blank Screen.
             05 Line  4 Col  3 Value "SEARCH CUSTOMER.".
             05 Line  6 Col  3 Value "CUSTOMER ID:".
             05 Line  6 Col 16 Pic X(6) Using CUSTID.
             05 Line 23 Col  2 Value "Options: [B]ack [S]earch".
             05 Line 23 Col 27 Pic X Using WS-INPKEY.
             05 Line 23 Col 42 Value "STATUS:".
             05 Line 23 Col 50 Pic X(30) Using WS-STATUS.

           01 SS-SEARCH-CUST-2.
             05 Blank Screen.
             05 Line  4 Col  3 Value "SEARCH CUSTOMER.".
             05 Line  6 Col  3 Value "CUSTOMER ID:".
             05 Line  6 Col 16 Pic X(6) From CUSTID.
             05 Line  8 Col  3 Value "NAME ......:".
             05 Line  8 Col 16 Pic X(20) From CUSTNAME.
             05 Line 10 Col  3 Value "PHONE #1 ..:".
             05 Line 10 Col 16 Pic X(10) From CUSTPHN1.
             05 Line 12 Col  3 Value "PHONE #2 ..:".
             05 Line 12 Col 16 Pic X(10) From CUSTPHN2.
             05 Line 23 Col  2 Value "Options: [B]ack".
             05 Line 23 Col 18 Pic X Using WS-INPKEY.
      
       Procedure Division.
       100-Main.
         Perform 110-Main-Loop
           Until WS-INPKEY Equal "B".
         Move Space To WS-INPKEY.
         Move Space To WS-STATUS.
         Perform 999-End-Of-SubRutine.

       110-Main-Loop.
         Display SS-SEARCH-CUST-1.
         Accept  SS-SEARCH-CUST-1.
         Evaluate WS-INPKEY
           When "S" Perform 120-Search-Customer
           When "B" Perform 999-End-Of-SubRutine
         End-Evaluate.

       120-Search-Customer.
         Call "SUB104" Using WS-CUST-DAT, WS-RETVAL.
         If WS-RETVAL Not Equal "00" Then
           Move "Customer not found!" To WS-STATUS
         Else
           Move Space To WS-INPKEY
           Move Space To WS-STATUS
           Display SS-SEARCH-CUST-2
           Accept  SS-SEARCH-CUST-2
         End-If.

       130-Clear-Fields.
         Move Space To WS-INPKEY.
         Move Space To CUSTNAME.
         Move Space To CUSTPHN1.
         Move Space To CUSTPHN2.
         Move "Fields cleared successfully!" To WS-STATUS.
       
       999-End-Of-SubRutine.
         Exit Program.
