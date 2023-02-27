      *>***************************************************************
      *>                                                             **
      *> AUTHOR:       JONAS HOLM                                    **
      *>               Copyright (C) 2023, Jonas Holm                **
      *>                                                             **
      *> DATE-WRITTEN: 2023-02-26                                    **
      *>                                                             **
      *> DESCRIPTION:                                                **
      *> Test program for testing the different subrutines.          **
      *>***************************************************************
      *>  DATE  CHANGE DESCRIPTION                                   **
      *> ====== ==================================================== **
      *> 230226 Created.                                             **
      *>***************************************************************
       Identification Division.
         Program-Id.   TST001.

       Data Division.
         Working-Storage Section.
           01 WS-CUST-DAT.
             05 DCUSTID   Pic X(6).
             05 DCUSTNAME Pic X(20).
             05 DCUSTPHN1 Pic X(10).
             05 DCUSTPHN2 Pic X(10).
           01 WS-RETVAL   Pic X(2). 
      
       Procedure Division.
       100-Main.
         Display "TST001".
         Perform 320-UI-Delete-Customer.
         Perform 999-End-Of-Program.

       200-Create-Customer.
         Display "200-Create-Customer.".
         Move "0"          To DCUSTID.
         Move "J. DOE"     To DCUSTNAME.
         Move "1000000011" To DCUSTPHN1.
         Move "2000000022" To DCUSTPHN2.
         Call "SUB101" Using WS-CUST-DAT.
         Display "End of 200-Create-Customer.".

       210-Update-Customer.
         Display "210-Update-Customer.".
         Move "000002"    To DCUSTID.
         Move "J. DOE #2" To DCUSTNAME.
         Move "100000011" To DCUSTPHN1.
         Move "200000022" To DCUSTPHN2.
         Call "SUB102" Using WS-CUST-DAT, WS-RETVAL.
         Display "WS-RETVAL: " WS-RETVAL.
         Display "End of 210-Update-Customer.".

       220-Remove-Customer.
         Display "220-Remove-Customer.".
         Move "000002" To DCUSTID.
         Call "SUB103" Using WS-CUST-DAT, WS-RETVAL.
         Display "WS-RETVAL: " WS-RETVAL.
         Display "End of 220-Remove-Customer.".
      
       230-Search-Customer.
         Display "230-Search-Customer.".
         Move "000003" To DCUSTID.
         Call "SUB104" Using WS-CUST-DAT, WS-RETVAL.
         Display "WS-RETVAL: " WS-RETVAL.
         Display WS-CUST-DAT.
         Display "End of 230-Search-Customer.".

       300-UI-Create-Customer.
         Call "SUB100".

       310-UI-Update-Customer.
         Call "SUB200".

       320-UI-Delete-Customer.
         Call "SUB300".

       999-End-Of-Program.
         Stop Run.

