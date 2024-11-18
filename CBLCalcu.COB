      ******************************************************************
      * Author:  Beri
      * Date:    18/11/24
      * Purpose: Simple COBOL Calculator
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CBLCalcu.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-MODE                  PIC X(01).

       77 WS-NUM-1                 PIC 9(02).
       77 WS-NUM-2                 PIC 9(02).

       77 WS-RESULT                PIC 9(03).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            INITIALIZE WS-MODE
                       WS-NUM-1
                       WS-NUM-2
                       WS-RESULT

            DISPLAY "*************************************************"
            DISPLAY "Select an operation:"
            DISPLAY "<1> Addition"
            DISPLAY "<2> Substraction"
            DISPLAY "<3> Division"
            DISPLAY "<4> Multiplication"
            DISPLAY "*************************************************"
            ACCEPT WS-MODE

            DISPLAY "Input the first number:"
            ACCEPT WS-NUM-1

            DISPLAY "Input the second number:"
            ACCEPT WS-NUM-2


            EVALUATE WS-MODE
                   WHEN "1"
                       PERFORM PROC-ADD
                               THRU PROC-ADD-END
                   WHEN "2"
                       PERFORM PROC-SUBTRACT
                               THRU PROC-SUBTRACT-END
                   WHEN "3"
                       PERFORM PROC-SUBTRACT
                               THRU PROC-SUBTRACT-END
                   WHEN "4"
                       PERFORM PROC-MULTI
                               THRU PROC-MULTI-END
                   WHEN OTHER
                       DISPLAY "INVALID VALUE!"
                       PERFORM MAIN-PROCEDURE
                               THRU MAIN-PROCEDURE-END
            END-EVALUATE

            DISPLAY "*************************************************"
            DISPLAY "Do you want to continue?"
            DISPLAY "<S> To continue"
            DISPLAY "<ANY KEY> To exit"
            DISPLAY "*************************************************"
            ACCEPT WS-MODE

            EVALUATE WS-MODE
                   WHEN "S"
                       PERFORM MAIN-PROCEDURE
                               THRU MAIN-PROCEDURE-END
                   WHEN "s"
                       PERFORM MAIN-PROCEDURE
                               THRU MAIN-PROCEDURE-END
                   WHEN OTHER
                       PERFORM PROC-CLOSE

            END-EVALUATE

            .
       MAIN-PROCEDURE-END.

       PROC-ADD.
            COMPUTE WS-RESULT = WS-NUM-1 + WS-NUM-2

            DISPLAY "Add " WS-NUM-1 " + " WS-NUM-2
                    "  Sum: " WS-RESULT
            .
       PROC-ADD-END.

       PROC-SUBTRACT.
            COMPUTE WS-RESULT = WS-NUM-1 - WS-NUM-2

            DISPLAY "Subtract " WS-NUM-1 " + " WS-NUM-2
                    "  Difference: " WS-RESULT
            .
       PROC-SUBTRACT-END.

       PROC-DIVIDE.
            COMPUTE WS-RESULT = WS-NUM-1 / WS-NUM-2

            DISPLAY "Divide " WS-NUM-1 " + " WS-NUM-2
                    "  Quotient: " WS-RESULT
            .
       PROC-DIVIDE-END.

       PROC-MULTI.
            COMPUTE WS-RESULT = WS-NUM-1 * WS-NUM-2

            DISPLAY "Multiply " WS-NUM-1 " + " WS-NUM-2
                    "  Product: " WS-RESULT
            .
       PROC-MULTI-END.

       PROC-CLOSE.
            STOP RUN.
       END PROGRAM CBLCalcu.
