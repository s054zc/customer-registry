      *>***************************************************************
      *>                                                             **
      *> AUTHOR:       JONAS HOLM                                    **
      *>               Copyright (C) 2023, Jonas Holm                **
      *>                                                             **
      *> DATE-WRITTEN: 2023-02-26                                    **
      *>                                                             **
      *> DESCRIPTION:                                                **
      *> A subrutine to create customer.                             **
      *>***************************************************************
      *>  DATE  CHANGE DESCRIPTION                                   **
      *> ====== ==================================================== **
      *> 230226 Created.                                             **
      *>***************************************************************
       Identification Division.
         Program-Id.   SUB200.

       Data Division.
         Working-Storage Section.
           01 WS-CUSTFILE Pic X(20) Value "data/CUSTOMER.DAT".
           01 WS-CUSTSTAT Pic 9(2).
           01 WS-CUST-DAT.
             05 CUSTID    Pic X(6)  Value Space.
             05 CUSTNAME  Pic X(20) Value Space.
             05 CUSTPHN1  Pic X(10) Value Space.
             05 CUSTPHN2  Pic X(10) Value Space.
           01 WS-RETVAL   Pic X(2)  Value Space.
           01 WS-INPKEY   Pic X     Value Space.
           01 WS-STATUS   Pic X(30) Value Space.

         Screen Section.
           01 SS-CREATE-CUST.
             05 Blank Screen.
             05 Line  4 Col  3 Value "CREATE CUSTOMER.".
             05 Line  6 Col  3 Value "NAME ......:".
             05 Line  6 Col 16 Pic X(20) Using CUSTNAME.
             05 Line  8 Col  3 Value "PHONE #1 ..:".
             05 Line  8 Col 16 Pic X(10) Using CUSTPHN1.
             05 Line 10 Col  3 Value "PHONE #2 ..:".
             05 Line 10 Col 16 Pic X(10) Using CUSTPHN2.
             05 Line 23 Col  2 Value "Options: [B]ack [R]eset [C]reate".
             05 Line 23 Col 35 Pic X Using WS-INPKEY.
             05 Line 23 Col 42 Value "STATUS:".
             05 Line 23 Col 50 Pic X(30) Using WS-STATUS.
      
       Procedure Division.
       100-Main.
         Perform 110-Main-Loop
           Until WS-INPKEY Equal "B".
         Move Space To WS-INPKEY.
         Move Space To WS-STATUS.
         Perform 999-End-Of-SubRutine.

       110-Main-Loop.
         Display SS-CREATE-CUST.
         Accept  SS-CREATE-CUST.
         Evaluate WS-INPKEY
           When "C" Perform 120-Create-Customer
           When "R" Perform 130-Reset-Screen
           When "B" Perform 999-End-Of-SubRutine
         End-Evaluate.

       120-Create-Customer.
         Move "0"   To CUSTID.
         Call "SUB101" Using WS-CUST-DAT, WS-RETVAL.
         If WS-RETVAL Equal "00" Then
           Move "Customer created successfully!" To WS-STATUS
         Else
           Move "Failed to create customer!" To WS-STATUS
         End-If.
         Move Space To WS-INPKEY.
         Move Space To CUSTNAME.
         Move Space To CUSTPHN1.
         Move Space To CUSTPHN2.
       
       130-Reset-Screen.
         Move Space To WS-INPKEY.
         Move Space To CUSTNAME.
         Move Space To CUSTPHN1.
         Move Space To CUSTPHN2.
         Move "Fields cleared successfully!" To WS-STATUS.
       
       999-End-Of-SubRutine.
         Exit Program.
