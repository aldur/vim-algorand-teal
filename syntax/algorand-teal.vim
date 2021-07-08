" TEAL v4 syntax file

if exists('b:current_syntax')
    finish
endif
let b:current_syntax = 'algorand-teal'

syntax keyword tealKeyword
            \ int
            \ byte
            \ addr
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
            \ arg_0
            \ arg_1
            \ arg_2
            \ arg_3
            \ txn
            \ gtxn
            \ txna
            \ gtxna
            \ gtxns
            \ gtxnsa
            \ global
            \ load
            \ store
            \ gload
            \ gloads
            \ gaid
            \ gaids

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

syntax keyword tealFunction
            \ sha256
            \ keccak256
            \ sha512_256
            \ ed25519verify
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

syntax match tealComment "\v//.*$"
syntax match tealPragma "\v^#pragma.*$"

syntax match tealBranchTarget "\v^[a-zA-Z_][a-zA-Z0-9_]*:$"
syntax match tealBranchLabel "\v[a-zA-Z_][a-zA-Z0-9_]*$"
syntax keyword tealBranch bnz bz b nextgroup=tealBranchTarget skipwhite

syntax match tealSubroutineTarget "\v^[a-zA-Z_][a-zA-Z0-9_]*:$"
syntax match tealSubroutineLabel "\v[a-zA-Z_][a-zA-Z0-9_]*:$"
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
highlight def link tealOnCompletionType Identifier

highlight def link tealBranchTarget Label
highlight def link tealBranchLabel Label

highlight def link tealSubroutineTarget Label
highlight def link tealSubroutineLabel Label

highlight def link tealControl Exception
highlight def link tealBranch Exception
highlight def link tealSubroutine Exception

highlight def link tealString String
