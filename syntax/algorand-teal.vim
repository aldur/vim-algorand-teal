" TEAL v5 syntax file
" To find new opcodes, look at
" https://github.com/algorand/go-algorand/blob/master/data/transactions/logic/TEAL_opcodes.md
"
" Also:
" $ cd go-algorand
" $ make
" $ cat langspec.json | jq '.Ops[].Name' | sort -u > /tmp/new.opcodes
" $ # diff with old langspec.json

if exists('b:current_syntax')
    finish
endif
let b:current_syntax = 'algorand-teal'

syntax keyword tealKeyword
            \ int
            \ byte
            \ addr
            \ cover
            \ uncover
            \ intcblock
            \ intc
            \ intc_0
            \ intc_1
            \ intc_2
            \ intc_3
            \ pushint
            \ bytecblock
            \ bytec
            \ bytec_0
            \ bytec_1
            \ bytec_2
            \ bytec_3
            \ pushbytes
            \ arg
            \ args
            \ arg_0
            \ arg_1
            \ arg_2
            \ arg_3
            \ txn
            \ gtxn
            \ txna
            \ txnas
            \ gtxna
            \ gtxnas
            \ gtxns
            \ gtxnsa
            \ gtxnsas
            \ gitxn
            \ gitxna
            \ global
            \ load
            \ loads
            \ store
            \ stores
            \ gload
            \ gloads
            \ gloadss
            \ gaid
            \ gaids
            \ extract
            \ extract3
            \ extract_uint16
            \ extract_uint32
            \ extract_uint64
            \ base64_decode
            \ itxn
            \ itxna
            \ itxn_begin
            \ itxn_submit
            \ itxn_next

syntax keyword tealControl
            \ err
            \ return
            \ pop
            \ dup
            \ dup2
            \ dig
            \ swap
            \ select
            \ assert
            \ retsub
            \ log

syntax keyword tealUnit
            \ balance
            \ min_balance
            \ app_opted_in
            \ app_local_get
            \ app_local_get_ex
            \ app_global_get
            \ app_global_get_ex
            \ app_local_put
            \ app_global_put
            \ app_local_del
            \ app_global_del
            \ asset_holding_get
            \ asset_params_get
            \ app_params_get
            \ acct_params_get
            \ itxn_field

syntax keyword tealFunction
            \ sha256
            \ keccak256
            \ sha512_256
            \ ed25519verify
            \ ecdsa_pk_decompress
            \ ecdsa_pk_recover
            \ ecdsa_verify
            \ len
            \ itob
            \ btoi
            \ mulw
            \ addw
            \ getbit
            \ setbit
            \ getbyte
            \ setbyte
            \ concat
            \ substring
            \ substring3
            \ shl
            \ shr
            \ divmodw
            \ exp
            \ expw
            \ sqrt
            \ bsqrt
            \ log2
            \ bzero
            \ bitlen

syntax keyword tealTxnField
            \ Sender
            \ Fee
            \ FirstValid
            \ FirstValidTime
            \ LastValid
            \ Note
            \ Lease
            \ Receiver
            \ Amount
            \ CloseRemainderTo
            \ VotePK
            \ SelectionPK
            \ VoteFirst
            \ VoteLast
            \ VoteKeyDilution
            \ Type
            \ TypeEnum
            \ XferAsset
            \ AssetAmount
            \ AssetSender
            \ AssetReceiver
            \ AssetCloseTo
            \ GroupIndex
            \ TxID
            \ ApplicationID
            \ OnCompletion
            \ ApplicationArgs
            \ NumAppArgs
            \ Accounts
            \ NumAccounts
            \ ApprovalProgram
            \ ClearStateProgram
            \ RekeyTo
            \ ConfigAsset
            \ ConfigAssetTotal
            \ ConfigAssetDecimals
            \ ConfigAssetDefaultFrozen
            \ ConfigAssetUnitName
            \ ConfigAssetName
            \ ConfigAssetURL
            \ ConfigAssetMetadataHash
            \ ConfigAssetManager
            \ ConfigAssetReserve
            \ ConfigAssetFreeze
            \ ConfigAssetClawback
            \ FreezeAsset
            \ FreezeAssetAccount
            \ FreezeAssetFrozen
            \ Assets
            \ NumAssets
            \ Applications
            \ NumApplications
            \ GlobalNumUint
            \ GlobalNumByteSlice
            \ LocalNumUint
            \ LocalNumByteSlice
            \ ExtraProgramPages

syntax keyword tealTxnType
            \ unknown
            \ pay
            \ keyreg
            \ acfg
            \ axfer
            \ afrz
            \ appl

syntax keyword tealGlobalFields
            \ MinTxnFee
            \ MinBalance
            \ MaxTxnLife
            \ ZeroAddress
            \ GroupSize
            \ LogicSigVersion
            \ Round
            \ LatestTimestamp
            \ CurrentApplicationID
            \ CreatorAddress
            \ CurrentApplicationAddress
            \ GroupID
            \ OpcodeBudget
            \ CallerApplicationID
            \ CallerApplicationAddress

syntax keyword tealAssetHoldingFields
            \ AssetBalance
            \ AssetFrozen

syntax keyword tealAssetParamsFields
            \ AssetTotal
            \ AssetDecimals
            \ AssetDefaultFrozen
            \ AssetUnitName
            \ AssetName
            \ AssetURL
            \ AssetMetadataHash
            \ AssetManager
            \ AssetReserve
            \ AssetFreeze
            \ AssetClawback

syntax keyword tealOnCompletionType
            \ NoOp
            \ OptIn
            \ CloseOut
            \ ClearState
            \ UpdateApplication
            \ DeleteApplication

syntax keyword tealAppParamsFields
            \ AppApprovalProgram
            \ AppClearStateProgram
            \ AppGlobalNumUint
            \ AppGlobalNumByteSlice
            \ AppLocalNumUint
            \ AppLocalNumByteSlice
            \ AppExtraProgramPages
            \ AppCreator
            \ AppAddress

syntax keyword tealAcctParamsFields
            \ AcctBalance
            \ AcctMinBalance
            \ AcctAuthAddr

syntax match tealComment "\v//.*$"
syntax match tealPragma "\v^#pragma.*$"

syntax match tealBranchTarget "\v[a-zA-Z_][a-zA-Z0-9_]*$" contained
syntax match tealBranchLabel "\v^\s*[a-zA-Z_][a-zA-Z0-9_]*:"
syntax keyword tealBranch bnz bz b nextgroup=tealBranchTarget skipwhite

syntax match tealSubroutineTarget "\v[a-zA-Z_][a-zA-Z0-9_]*$" contained
syntax match tealSubroutineLabel "\v^\s*[a-zA-Z_][a-zA-Z0-9_]*:"
syntax keyword tealSubroutine callsub nextgroup=tealSubroutineTarget skipwhite

" Ordering is important here, see :h syn-priority
syntax match tealOperator "\v\=\="
syntax match tealOperator "\v\!\="
syntax match tealOperator "\v\+"
syntax match tealOperator "\v\-"
syntax match tealOperator "\v\*"
syntax match tealOperator "\v\\"
syntax match tealOperator "\v\<"
syntax match tealOperator "\v\>"
syntax match tealOperator "\v\<\="
syntax match tealOperator "\v\&"
syntax match tealOperator "\v\|"
syntax match tealOperator "\v\>\="
syntax match tealOperator "\v\&\&"
syntax match tealOperator "\v\|\|"
syntax match tealOperator "\v\!"
syntax match tealOperator "\v\%"
syntax match tealOperator "\v\^"
syntax match tealOperator "\v\~"
syntax match tealOperator "\vb\+"
syntax match tealOperator "\vb\-"
syntax match tealOperator "\vb\*"
syntax match tealOperator "\vb\/"
syntax match tealOperator "\vb\%"
syntax match tealOperator "\vb\<"
syntax match tealOperator "\vb\>"
syntax match tealOperator "\vb\<\="
syntax match tealOperator "\vb\>\="
syntax match tealOperator "\vb\=\="
syntax match tealOperator "\vb\!\="
syntax match tealOperator "\vb\\"
syntax match tealOperator "\vb\&"
syntax match tealOperator "\vb\^"
syntax match tealOperator "\vb\~"

syntax region tealString start=/\v"/ skip=/\v\\./ end=/\v"/

highlight def link tealKeyword Keyword
highlight def link tealUnit Keyword

highlight def link tealFunction Function

highlight def link tealComment Comment

highlight def link tealPragma PreCondit

highlight def link tealOperator Operator

highlight def link tealTxnField Identifier
highlight def link tealTxnType Identifier
highlight def link tealGlobalFields Identifier
highlight def link tealAssetHoldingFields Identifier
highlight def link tealAssetParamsFields Identifier
highlight def link tealAppParamsFields Identifier
highlight def link tealAcctParamsFields Identifier
highlight def link tealOnCompletionType Identifier

highlight def link tealBranchTarget Label
highlight def link tealBranchLabel Label

highlight def link tealSubroutineTarget Label
highlight def link tealSubroutineLabel Label

highlight def link tealControl Exception
highlight def link tealBranch Exception
highlight def link tealSubroutine Exception

highlight def link tealString String
