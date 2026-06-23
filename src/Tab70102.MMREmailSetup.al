table 70102 "MMR Email Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }

        field(2; "Report ID"; Integer)
        {
        }

        field(3; Enabled; Boolean)
        {
            InitValue = true;
        }

        field(4; "Subject Template"; Text[250])
        {
        }

        field(5; "Body Template"; Text[2048])
        {
        }

        field(6; "Send As HTML"; Boolean)
        {
            InitValue = true;
        }

        field(7; "Attach Report"; Boolean)
        {
            InitValue = true;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }

        key(ReportIdIdx; "Report ID")
        {
        }
    }
}