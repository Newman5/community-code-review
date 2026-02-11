// Empty file for testing and freestyle hacking

// Escrow Validator: Holds some value and releseses 
// it to the specific entity when some conditions are met.

// Validator holds a token (in a UTXO)
// Define buyer(student) and seller(teacher)
// Student buys course, teacher approves assignments, 
//if student completes assignments he gets x amount of money back

// x amount is locked in a validator
// Teacher can approve assignment (using their private key hash)
// In case of dispute, there is a Admin (app), 
// that can unlock value without any other conditions w/ their key hash

// Each student locks a UTXO in the validator w/ datum as their vKeyhash
// They can unlock the UTXO when the teacher approves w/ a signatuire

// Params: Teacher(vkeyhash), Student(vkeyhash), Admin(vkeyhash), 
use aiken/crypto.{VerificationKeyHash}

pub type Datum {
  student: VerificationKeyHash,
}

pub type CashbackRedeemer {
  Assignment 
  Dispute
}


validator student_cashback(
  teacher: VerificationKeyHash,
  admin: VerificationKeyHash,
) {
    spend(
        datum: Option<Datum>,
        redeemer: CashbackRedeemer,
        input: OutputReference,
        self: Transaction,
    ){
        expect Some(Datum { student }) = datum
        when redeemer is {
            Assignment -> {
                
            }
            Dispute -> {
                
            }
        }

        
    }

    else(_) {
        fail
    }
}
