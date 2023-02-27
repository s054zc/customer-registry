      *>***************************************************************
      *>                                                             **
      *> AUTHOR:       JONAS HOLM                                    **
      *>               Copyright (C) 2023, Jonas Holm                **
      *>                                                             **
      *> DATE-WRITTEN: 2023-02-25                                    **
      *>                                                             **
      *> DESCRIPTION:                                                **
      *> A subrutine to create customer.                             **
      *>                                                             **
      *> LS-RETVAL:                                                  **
      *>  00: Success.                                               **
      *>***************************************************************
      *>  DATE  CHANGE DESCRIPTION                                   **
      *> ====== ==================================================== **
      *> 230225 Created.                                             **
      *>***************************************************************
       Identification Division.
         Program-Id.   SUB101.

       Environment Division.
         Input-Output Section.
         File-Control.
           Select CUST Assign WS-CUSTFILE
             Organization Is Indexed
             Access Mode  Is Sequential
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

       200-Create-Customer.
         Move "00" To LS-RETVAL.
         If LCUSTID Equal "0" Then
           Call "SUB001" Using LCUSTID
         End-If.

         Open Input CUST.
         If WS-CUSTSTAT Equal "35" Then
           Close CUST
           Open Output CUST
             Write CUST-REC From LS-PRMSET
             End-Write
           Close CUST
         Else
           Close CUST
           Open Extend CUST
             Write CUST-REC From LS-PRMSET
             End-Write
           Close CUST
         End-If.
       
       999-End-Of-SubRutine.
         Exit Program.
