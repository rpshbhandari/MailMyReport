table 70101 "MMR Report Recipient"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }

        field(2; "Setup Entry No."; Integer)
        {
            TableRelation = "MMR Email Setup"."Entry No.";
        }

        field(3; "Email Address"; Text[250])
        {
            trigger OnValidate()
            begin
                if "Email Address" = '' then
                    Error('Email Address cannot be empty.');
            end;
        }

        field(4; Active; Boolean)
        {
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }

        key(SetupEntryIdx; "Setup Entry No.", Active)
        {
        }

        key(EmailAddressIdx; "Email Address", Active)
        {
        }
    }
}