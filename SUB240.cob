      *>***************************************************************
      *>                                                             **
      *> AUTHOR:       JONAS HOLM                                    **
      *>               Copyright (C) 2023, Jonas Holm                **
      *>                                                             **
      *> DATE-WRITTEN: 2023-02-27                                    **
      *>                                                             **
      *> DESCRIPTION:                                                **
      *> A subrutine to show text about this application.            **
      *>***************************************************************
      *>  DATE  CHANGE DESCRIPTION                                   **
      *> ====== ==================================================== **
      *> 230227 Created.                                             **
      *>***************************************************************
       Identification Division.
         Program-Id.   SUB240.

       Data Division.
         Working-Storage Section.
           01 WS-INPKEY Pic X Value Space.

         Screen Section.
           01 SS-ABOUT.
            05 Blank Screen.
            05 Line 12 Col 24 Value "A LIGHTWEIGHT CUSTOMER REGISTRY.".
            05 Line 23 Col  2 Value "Options: [B]ack".
            05 Line 23 Col 18 Pic X Using WS-INPKEY.
      
       Procedure Division.
       100-Main.
         Perform 110-Main-Loop
           Until WS-INPKEY Equal "B".
         Move Space To WS-INPKEY.
         Perform 999-End-Of-SubRutine.

       110-Main-Loop.
         Display SS-ABOUT.
         Accept  SS-ABOUT.

       999-End-Of-SubRutine.
         Exit Program.
