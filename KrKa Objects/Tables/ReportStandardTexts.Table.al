table 59000 "Report Standard Texts"
{
    Caption = 'Report Standard Texts';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Code[10])
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Sales Invoice Report Text 1"; Text[100])
        {
            Caption = 'Sales Invoice Report Text 1';
            DataClassification = ToBeClassified;
        }
        field(3; "Sales Invoice Report Text 2"; Text[100])
        {
            Caption = 'Sales Invoice Report Text 2';
            DataClassification = ToBeClassified;
        }
        field(4; "Sales Invoice Report Text 3"; Text[100])
        {
            Caption = 'Sales Invoice Report Text 3';
            DataClassification = ToBeClassified;
        }
        field(5; "Sales Invoice Report Text 4"; Text[100])
        {
            Caption = 'Sales Invoice Report Text 4';
            DataClassification = ToBeClassified;
        }
        field(6; "Sales Invoice Report Text 5"; Text[100])
        {
            Caption = 'Sales Invoice Report Text 5';
            DataClassification = ToBeClassified;
        }
        field(7; "Sales Invoice Report Text 6"; Text[100])
        {
            Caption = 'Sales Invoice Report Text 6';
            DataClassification = ToBeClassified;
        }
        field(8; "Prepared By"; Text[100])
        {
            Caption = 'Prepared By';
        }
        field(9; Director; Text[100])
        {
            Caption = 'Director';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

}
