      *>***************************************************************
      *>                                                             **
      *> AUTHOR:       JONAS HOLM                                    **
      *>               Copyright (C) 2023, Jonas Holm                **
      *>                                                             **
      *> DATE-WRITTEN: 2023-02-26                                    **
      *>                                                             **
      *> DESCRIPTION:                                                **
      *> A subrutine to update customer.                             **
      *>                                                             **
      *> LS-RETVAL:                                                  **
      *>  00: Success.                                               **
      *>  01: Customer file not found.                               **
      *>  02: Customer not found, ID/key LCUSTID.                    **
      *>***************************************************************
      *>  DATE  CHANGE DESCRIPTION                                   **
      *> ====== ==================================================== **
      *> 230226 Created.                                             **
      *>***************************************************************
       Identification Division.
         Program-Id.   SUB102.

       Environment Division.
         Input-Output Section.
         File-Control.
           Select CUST Assign WS-CUSTFILE
             Organization Is Indexed
             Access Mode  Is Random
             Record Key   Is RCUSTID
             File Status WS-CUSTSTAT.

       Data Division.
         File Section.
           Fd CUST.
           01 CUST-REC.
             05 RCUSTID   Pic X(6)  Value Space.
             05 RCUSTNAME Pic X(20) Value Space.
             05 RCUSTPHN1 Pic X(10) Value Space.
             05 RCUSTPHN2 Pic X(10) Value Space.

         Working-Storage Section.
           01 WS-CUSTFILE Pic X(20) Value "data/CUSTOMER.DAT".
           01 WS-CUSTSTAT Pic 9(2).

         Linkage Section.
           01 LS-PRMSET.
             05 LCUSTID   Pic X(6).
             05 LCUSTNAME Pic X(20).
             05 LCUSTPHN1 Pic X(10).
             05 LCUSTPHN2 Pic X(10). 
           01 LS-RETVAL   Pic X(2).
      
       Procedure Division Using LS-PRMSET, LS-RETVAL.
       100-Main.

       200-Update-Customer.
         Move "00"    To LS-RETVAL.
         Move LCUSTID To RCUSTID

         Open I-O CUST.
         If WS-CUSTSTAT Equal "35" Then
           Move "01" To LS-RETVAL
           Close CUST
         Else
           Read CUST
             Key Is RCUSTID
             Invalid Key Move "02" To LS-RETVAL
           End-Read

           Move LCUSTNAME To RCUSTNAME
           Move LCUSTPHN1 To RCUSTPHN1
           Move LCUSTPHN2 To RCUSTPHN2

           Rewrite CUST-REC
           End-Rewrite
           Close CUST
         End-If.
       
       999-End-Of-SubRutine.
         Exit Program.
