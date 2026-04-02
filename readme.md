# HL7 v2.x integration with replay mechanism and XML-safe processing

## Overview

This project implements an HL7 v2.x integration using Mirth Connect.

It supports:

* Receiving ADT messages over TCP
* Patient data processing and persistence
* Raw message auditing
* Replay of failed messages from database

---

## Architecture

* HL7_ADT_Receiver (TCP Listener)
* Replay_Channel (DB → TCP Sender)

---

## Features

* HL7 parsing (ADT^A01)
* Error handling and rejection
* Raw message storage
* Replay mechanism for failed messages
* XML-to-HL7 correction for replay

---

## Technologies

* Mirth Connect
* SQL Server
* HL7 v2.x (ER7 format)

---

## How to Run

1. Import channels into Mirth Connect
2. Run SQL script (`sql/schema.sql`)
3. Start HL7_ADT_Receiver
4. Send HL7 messages via TCP
5. Use Replay_Channel to reprocess failed messages

---

## Example HL7 Message

MSH|^~&|HIS|BRUSSELS_HOSPITAL|EMR|HOSPITAL|20260330120000||ADT^A01|MSG00001|P|2.3
PID|1||99999^^^HOSPITAL||Doe^John||19800101|M
PV1|1|I|WARD^101^1||||1234^Smith^John

---

## Author

Abdo Beirekdar
