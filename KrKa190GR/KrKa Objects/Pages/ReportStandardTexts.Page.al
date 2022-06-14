page 59000 "Report Standard Texts"
{

    ApplicationArea = All;
    Caption = 'Report Standard Texts';
    PageType = List;
    SourceTable = "Report Standard Texts";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Sales Invoice Report Text 1"; Rec."Sales Invoice Report Text 1")
                {
                    ApplicationArea = All;
                }
                field("Sales Invoice Report Text 2"; Rec."Sales Invoice Report Text 2")
                {
                    ApplicationArea = All;
                }
                field("Sales Invoice Report Text 3"; Rec."Sales Invoice Report Text 3")
                {
                    ApplicationArea = All;
                }
                field("Sales Invoice Report Text 4"; Rec."Sales Invoice Report Text 4")
                {
                    ApplicationArea = All;
                }
                field("Sales Invoice Report Text 5"; Rec."Sales Invoice Report Text 5")
                {
                    ApplicationArea = All;
                }
                field("Sales Invoice Report Text 6"; Rec."Sales Invoice Report Text 6")
                {
                    ApplicationArea = All;
                }
                field("Prepared By"; Rec."Prepared By")
                {
                    ApplicationArea = All;
                }
                field(Director; Rec.Director)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
