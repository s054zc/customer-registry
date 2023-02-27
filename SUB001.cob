      *>***************************************************************
      *>                                                             **
      *> AUTHOR:       JONAS HOLM                                    **
      *>               Copyright (C) 2023, Jonas Holm                **
      *>                                                             **
      *> DATE-WRITTEN: 2023-02-25                                    **
      *>                                                             **
      *> DESCRIPTION:                                                **
      *> Generate a new customer ID based on the value in the .SEQ   **
      *> file. If no .SEQ file is found, it will be created and      **
      *> initialized to "1".                                         **
      *>***************************************************************
      *>  DATE  CHANGE DESCRIPTION                                   **
      *> ====== ==================================================== **
      *> 230225 Created.                                             **
      *>***************************************************************
       Identification Division.
         Program-Id.   SUB001.

       Environment Division.
         Input-Output Section.
         File-Control.
           Select CSEQ Assign WS-CSEQFILE
             Access Mode Is Sequential
             File Status WS-CSEQSTAT.
       
       Data Division.
         File Section.
           Fd CSEQ.
           01 CSEQ-REC Pic 9(6).

         Working-Storage Section.
           01 WS-CSEQFILE Pic X(20) Value "data/CUSTOMER.SEQ".
           01 WS-CSEQSTAT Pic 9(2).
           01 WS-CSEQ-NUM Pic 9(6).
           01 WS-CSEQ-REF Redefines WS-CSEQ-NUM Pic X(6).

         Linkage Section.
           01 LS-CSEQ-NUM Pic 9(6).

       Procedure Division Using LS-CSEQ-NUM.
       100-Main.
         Open Input CSEQ.
         If WS-CSEQSTAT Equal "35" Then
           Close CSEQ
           Move 1 To WS-CSEQ-NUM
           Open Output CSEQ
             Write CSEQ-REC From WS-CSEQ-REF
             End-Write
           Close CSEQ
         Else
           Move 0 To WS-CSEQ-NUM
           Read CSEQ Record Into WS-CSEQ-NUM
           End-Read
           Close CSEQ
           Compute WS-CSEQ-NUM = (WS-CSEQ-NUM + 1)
           Open Output CSEQ
             Write CSEQ-REC From WS-CSEQ-REF
             End-Write
           Close CSEQ
         End-If.

         Move WS-CSEQ-REF To LS-CSEQ-NUM.

       999-End-Of-SubRutine.
         Exit Program.
