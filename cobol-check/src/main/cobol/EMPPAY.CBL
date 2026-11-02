 IDENTIFICATION DIVISION.
      PROGRAM-ID. EMPPAY.
      AUTHOR. ASHIS KUMAR NAIK.
      DATA DIVISION.
      WORKING-STORAGE SECTION.
      77  REC-COUNTER              PIC 9(1).
      01  EMP-RECORD.
          05  EMP-NAME.
                10 EMP-FNAME        PIC X(15) VALUE 'FRANCISCO'.
                10 EMP-LNAME        PIC X(15).
          05  EMP-HOURLY-RATE      PIC 9(3)V99.
          05  EMP-OT-RATE          PIC V99.
          05  EMP-REWARD           PIC V99.
          05  EMP-HOURS            PIC 9(3).
          05  EMP-PAY-WEEK         PIC 9(7)V99.
          05  EMP-PAY-MONTH        PIC 9(7)V99.
      PROCEDURE DIVISION.
          PERFORM INITIALIZATION.
          PERFORM PAYMENT-WEEKLY.
          PERFORM PAYMENT-MONTHLY.
          PERFORM SHOW-OUTPUT.
          STOP RUN.
      INITIALIZATION.
          MOVE "Millard"           TO EMP-FNAME.
          MOVE "Fillmore"          TO EMP-LNAME.
          MOVE 19                  TO EMP-HOURS.
          MOVE 23.50               TO EMP-HOURLY-RATE.
      PAYMENT-WEEKLY.
