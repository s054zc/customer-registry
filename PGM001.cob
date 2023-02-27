      *>***************************************************************
      *>                                                             **
      *> AUTHOR:       JONAS HOLM                                    **
      *>               Copyright (C) 2023, Jonas Holm                **
      *>                                                             **
      *> DATE-WRITTEN: 2023-02-25                                    **
      *>                                                             **
      *> DESCRIPTION:                                                **
      *> A simple customer registry application.                     **
      *>***************************************************************
      *>  DATE  CHANGE DESCRIPTION                                   **
      *> ====== ==================================================== **
      *> 230225 Created.                                             **
      *>***************************************************************
       Identification Division.
         Program-Id.   PRG001.

       Data Division.
         Working-Storage Section.
           01 WS-INPKEY Pic X     Value Space.
           01 WS-STATUS Pic X(30) Value Space.

         Screen Section.
           01 SS-MENU.
             05 Blank Screen.
             05 Line  3 Col  8 Value "A SIMPLE CUSTOMER REGISTRY.".
             05 Line  6 Col 22 Value "MAIN MENU".
             05 Line  8 Col 22 Value "1. ... CREATE CUSTOMER".
             05 Line 10 Col 22 Value "2. ... UPDATE CUSTOMER".
             05 Line 12 Col 22 Value "3. ... REMOVE CUSTOMER".
             05 Line 14 Col 22 Value "4. ... SEARCH CUSTOMER".
             05 Line 16 Col 22 Value "5. ... ABOUT".
             05 Line 18 Col 22 Value "Q. ... QUIT".
             05 Line 20 Col 22 Value "SELECT OPTION:".
             05 Line 20 Col 37 Pic X Using WS-INPKEY.
             05 Line 23 Col 42 Value "STATUS:".
             05 Line 23 Col 50 Pic X(30) Using WS-STATUS.
      
       Procedure Division.
       100-Main.
         Perform 110-Main-Loop
           Until WS-INPKEY Equal "Q".
         Move Space To WS-INPKEY.
         Move Space To WS-STATUS.
         Perform 999-End-Of-Program.

       110-Main-Loop.
         Display SS-MENU.
         Accept  SS-MENU.
         Evaluate WS-INPKEY
           When "1" Call "SUB200"
           When "2" Call "SUB210"
           When "3" Call "SUB220"
           When "4" Call "SUB230"
           When "5" Call "SUB240"
           When "Q" Perform 999-End-Of-Program
           When Other Move "Unknown option!" To WS-STATUS
         End-Evaluate.
         Move Space To WS-INPKEY.

       999-End-Of-Program.
         Stop Run.

