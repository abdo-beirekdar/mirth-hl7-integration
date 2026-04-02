            ┌──────────────────────┐
            │   HL7_ADT_Receiver   │
            │  (TCP Listener)      │
            └─────────┬────────────┘
                      │ HL7 (ER7)
                      ▼
            ┌──────────────────────┐
            │   Transformer        │
            │  + Validation        │
            └─────────┬────────────┘
                      │
        ┌─────────────┼─────────────┐
        ▼                           ▼
┌───────────────┐         ┌──────────────────┐
│ Patients DB   │         │ RawMessages DB   │
│ (business)    │         │ (audit/log)      │
└───────────────┘         └──────────────────┘


            (Replay Flow)
┌──────────────────────────────┐
│   Replay_Channel             │
│  (DB → TCP Sender)           │
└─────────────┬────────────────┘
              │ HL7
              ▼
       HL7_ADT_Receiver