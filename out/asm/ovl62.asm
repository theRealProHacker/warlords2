; ovl62 stub 30e8 file_off 0x78d30 size 0xbbd

ovl62_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  56               push si                                  
  0004  57               push di                                  
  0005  33d2             xor dx, dx                               
  0007  eb40             jmp 0x49                                 
  0009  33c9             xor cx, cx                               
  000b  eb35             jmp 0x42                                 
  000d  8bd9             mov bx, cx                               
  000f  69dbe000         imul bx, bx, 0xe0                        
  0013  8bc2             mov ax, dx                               
  0015  d1e0             shl ax, 1                                
  0017  03d8             add bx, ax                               
  0019  b81d1e           mov ax, 0x1e1d                           
  001c  8ec0             mov es, ax                               
  001e  2680a70100ef     and byte ptr es:[bx + 1], 0xef           
  0024  8bd9             mov bx, cx                               
  0026  69dbe000         imul bx, bx, 0xe0                        
  002a  8bc2             mov ax, dx                               
  002c  d1e0             shl ax, 1                                
  002e  03d8             add bx, ax                               
  0030  b81d1e           mov ax, 0x1e1d                           
  0033  8ec0             mov es, ax                               
  0035  2680a70100f0     and byte ptr es:[bx + 1], 0xf0           
  003b  26808f01000f     or byte ptr es:[bx + 1], 0xf             
  0041  41               inc cx                                   
  0042  81f99c00         cmp cx, 0x9c                             
  0046  7cc5             jl 0xd                                   
  0048  42               inc dx                                   
  0049  83fa70           cmp dx, 0x70                             
  004c  7cbb             jl 9                                     
  004e  b8042c           mov ax, 0x2c04                           
  0051  8ec0             mov es, ax                               
  0053  268b3e8101       mov di, word ptr es:[0x181]              
  0058  e99d00           jmp 0xf8                                 
  005b  8bdf             mov bx, di                               
  005d  6bdb16           imul bx, bx, 0x16                        
  0060  b81d1e           mov ax, 0x1e1d                           
  0063  8ec0             mov es, ax                               
  0065  2683bf828800     cmp word ptr es:[bx - 0x777e], 0         
  006b  7d03             jge 0x70                                 
  006d  e98800           jmp 0xf8                                 
  0070  8bdf             mov bx, di                               
  0072  6bdb16           imul bx, bx, 0x16                        
  0075  b81d1e           mov ax, 0x1e1d                           
  0078  ba0000           mov dx, 0                                
  007b  81c28088         add dx, 0x8880                           
  007f  03da             add bx, dx                               
  0081  8ec0             mov es, ax                               
  0083  268b07           mov ax, word ptr es:[bx]                 
  0086  d1e0             shl ax, 1                                
  0088  8bdf             mov bx, di                               
  008a  6bdb16           imul bx, bx, 0x16                        
  008d  ba1d1e           mov dx, 0x1e1d                           
  0090  8ec2             mov es, dx                               
  0092  268b9f8288       mov bx, word ptr es:[bx - 0x777e]        
  0097  69dbe000         imul bx, bx, 0xe0                        
  009b  03d8             add bx, ax                               
  009d  b81d1e           mov ax, 0x1e1d                           
  00a0  8ec0             mov es, ax                               
  00a2  26808f010010     or byte ptr es:[bx + 1], 0x10            
  00a8  8bdf             mov bx, di                               
  00aa  6bdb16           imul bx, bx, 0x16                        
  00ad  b81d1e           mov ax, 0x1e1d                           
  00b0  8ec0             mov es, ax                               
  00b2  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  00b7  98               cwde                                     
  00b8  250f00           and ax, 0xf                              
  00bb  8bdf             mov bx, di                               
  00bd  6bdb16           imul bx, bx, 0x16                        
  00c0  ba1d1e           mov dx, 0x1e1d                           
  00c3  b90000           mov cx, 0                                
  00c6  81c18088         add cx, 0x8880                           
  00ca  03d9             add bx, cx                               
  00cc  8ec2             mov es, dx                               
  00ce  268b17           mov dx, word ptr es:[bx]                 
  00d1  d1e2             shl dx, 1                                
  00d3  8bdf             mov bx, di                               
  00d5  6bdb16           imul bx, bx, 0x16                        
  00d8  b91d1e           mov cx, 0x1e1d                           
  00db  8ec1             mov es, cx                               
  00dd  268b9f8288       mov bx, word ptr es:[bx - 0x777e]        
  00e2  69dbe000         imul bx, bx, 0xe0                        
  00e6  03da             add bx, dx                               
  00e8  ba1d1e           mov dx, 0x1e1d                           
  00eb  8ec2             mov es, dx                               
  00ed  2680a70100f0     and byte ptr es:[bx + 1], 0xf0           
  00f3  2608870100       or byte ptr es:[bx + 1], al              
  00f8  8bc7             mov ax, di                               
  00fa  4f               dec di                                   
  00fb  0bc0             or ax, ax                                
  00fd  7403             je 0x102                                 
  00ff  e959ff           jmp 0x5b                                 
  0102  b8042c           mov ax, 0x2c04                           
  0105  8ec0             mov es, ax                               
  0107  268b3e7b15       mov di, word ptr es:[0x157b]             
  010c  e93601           jmp 0x245                                
  010f  8bdf             mov bx, di                               
  0111  6bdb41           imul bx, bx, 0x41                        
  0114  b8042c           mov ax, 0x2c04                           
  0117  8ec0             mov es, ax                               
  0119  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  011f  7503             jne 0x124                                
  0121  e92101           jmp 0x245                                
  0124  8bdf             mov bx, di                               
  0126  6bdb41           imul bx, bx, 0x41                        
  0129  8ec0             mov es, ax                               
  012b  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0130  98               cwde                                     
  0131  250f00           and ax, 0xf                              
  0134  8bdf             mov bx, di                               
  0136  6bdb41           imul bx, bx, 0x41                        
  0139  ba042c           mov dx, 0x2c04                           
  013c  8ec2             mov es, dx                               
  013e  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  0143  69dbe000         imul bx, bx, 0xe0                        
  0147  8bf7             mov si, di                               
  0149  6bf641           imul si, si, 0x41                        
  014c  ba042c           mov dx, 0x2c04                           
  014f  8ec2             mov es, dx                               
  0151  268b947d15       mov dx, word ptr es:[si + 0x157d]        
  0156  d1e2             shl dx, 1                                
  0158  03da             add bx, dx                               
  015a  ba1d1e           mov dx, 0x1e1d                           
  015d  8ec2             mov es, dx                               
  015f  2680a70100f0     and byte ptr es:[bx + 1], 0xf0           
  0165  2608870100       or byte ptr es:[bx + 1], al              
  016a  8bdf             mov bx, di                               
  016c  6bdb41           imul bx, bx, 0x41                        
  016f  b8042c           mov ax, 0x2c04                           
  0172  8ec0             mov es, ax                               
  0174  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0179  98               cwde                                     
  017a  250f00           and ax, 0xf                              
  017d  8bdf             mov bx, di                               
  017f  6bdb41           imul bx, bx, 0x41                        
  0182  ba042c           mov dx, 0x2c04                           
  0185  8ec2             mov es, dx                               
  0187  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  018c  69dbe000         imul bx, bx, 0xe0                        
  0190  8bf7             mov si, di                               
  0192  6bf641           imul si, si, 0x41                        
  0195  ba042c           mov dx, 0x2c04                           
  0198  8ec2             mov es, dx                               
  019a  268b947d15       mov dx, word ptr es:[si + 0x157d]        
  019f  d1e2             shl dx, 1                                
  01a1  03da             add bx, dx                               
  01a3  ba1d1e           mov dx, 0x1e1d                           
  01a6  8ec2             mov es, dx                               
  01a8  2680a7e100f0     and byte ptr es:[bx + 0xe1], 0xf0        
  01ae  260887e100       or byte ptr es:[bx + 0xe1], al           
  01b3  8bdf             mov bx, di                               
  01b5  6bdb41           imul bx, bx, 0x41                        
  01b8  b8042c           mov ax, 0x2c04                           
  01bb  8ec0             mov es, ax                               
  01bd  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  01c2  98               cwde                                     
  01c3  250f00           and ax, 0xf                              
  01c6  8bdf             mov bx, di                               
  01c8  6bdb41           imul bx, bx, 0x41                        
  01cb  ba042c           mov dx, 0x2c04                           
  01ce  8ec2             mov es, dx                               
  01d0  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  01d5  69dbe000         imul bx, bx, 0xe0                        
  01d9  8bf7             mov si, di                               
  01db  6bf641           imul si, si, 0x41                        
  01de  ba042c           mov dx, 0x2c04                           
  01e1  8ec2             mov es, dx                               
  01e3  268b947d15       mov dx, word ptr es:[si + 0x157d]        
  01e8  d1e2             shl dx, 1                                
  01ea  03da             add bx, dx                               
  01ec  ba1d1e           mov dx, 0x1e1d                           
  01ef  8ec2             mov es, dx                               
  01f1  2680a70300f0     and byte ptr es:[bx + 3], 0xf0           
  01f7  2608870300       or byte ptr es:[bx + 3], al              
  01fc  8bdf             mov bx, di                               
  01fe  6bdb41           imul bx, bx, 0x41                        
  0201  b8042c           mov ax, 0x2c04                           
  0204  8ec0             mov es, ax                               
  0206  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  020b  98               cwde                                     
  020c  250f00           and ax, 0xf                              
  020f  8bdf             mov bx, di                               
  0211  6bdb41           imul bx, bx, 0x41                        
  0214  ba042c           mov dx, 0x2c04                           
  0217  8ec2             mov es, dx                               
  0219  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  021e  69dbe000         imul bx, bx, 0xe0                        
  0222  8bf7             mov si, di                               
  0224  6bf641           imul si, si, 0x41                        
  0227  ba042c           mov dx, 0x2c04                           
  022a  8ec2             mov es, dx                               
  022c  268b947d15       mov dx, word ptr es:[si + 0x157d]        
  0231  d1e2             shl dx, 1                                
  0233  03da             add bx, dx                               
  0235  ba1d1e           mov dx, 0x1e1d                           
  0238  8ec2             mov es, dx                               
  023a  2680a7e300f0     and byte ptr es:[bx + 0xe3], 0xf0        
  0240  260887e300       or byte ptr es:[bx + 0xe3], al           
  0245  8bc7             mov ax, di                               
  0247  4f               dec di                                   
  0248  0bc0             or ax, ax                                
  024a  7403             je 0x24f                                 
  024c  e9c0fe           jmp 0x10f                                
  024f  33d2             xor dx, dx                               
  0251  eb63             jmp 0x2b6                                
  0253  33c9             xor cx, cx                               
  0255  eb58             jmp 0x2af                                
  0257  8bd9             mov bx, cx                               
  0259  69dbe000         imul bx, bx, 0xe0                        
  025d  8bc2             mov ax, dx                               
  025f  d1e0             shl ax, 1                                
  0261  03d8             add bx, ax                               
  0263  b81d1e           mov ax, 0x1e1d                           
  0266  8ec0             mov es, ax                               
  0268  268a870100       mov al, byte ptr es:[bx + 1]             
  026d  c1e805           shr ax, 5                                
  0270  250100           and ax, 1                                
  0273  0bc0             or ax, ax                                
  0275  7437             je 0x2ae                                 
  0277  8bd9             mov bx, cx                               
  0279  69dbe000         imul bx, bx, 0xe0                        
  027d  8bc2             mov ax, dx                               
  027f  d1e0             shl ax, 1                                
  0281  03d8             add bx, ax                               
  0283  b81d1e           mov ax, 0x1e1d                           
  0286  8ec0             mov es, ax                               
  0288  268a870100       mov al, byte ptr es:[bx + 1]             
  028d  c1e804           shr ax, 4                                
  0290  250100           and ax, 1                                
  0293  0bc0             or ax, ax                                
  0295  7517             jne 0x2ae                                
  0297  8bd9             mov bx, cx                               
  0299  69dbe000         imul bx, bx, 0xe0                        
  029d  8bc2             mov ax, dx                               
  029f  d1e0             shl ax, 1                                
  02a1  03d8             add bx, ax                               
  02a3  b81d1e           mov ax, 0x1e1d                           
  02a6  8ec0             mov es, ax                               
  02a8  2680a70100df     and byte ptr es:[bx + 1], 0xdf           
  02ae  41               inc cx                                   
  02af  81f99c00         cmp cx, 0x9c                             
  02b3  7ca2             jl 0x257                                 
  02b5  42               inc dx                                   
  02b6  83fa70           cmp dx, 0x70                             
  02b9  7c98             jl 0x253                                 
  02bb  5f               pop di                                   
  02bc  5e               pop si                                   
  02bd  5d               pop bp                                   
  02be  cb               retf                                     

ovl62_02bf:  ; ENTRY
  02bf  55               push bp                                  
  02c0  8bec             mov bp, sp                               
  02c2  56               push si                                  
  02c3  33c9             xor cx, cx                               
  02c5  eb0b             jmp 0x2d2                                
  02c7  8bd9             mov bx, cx                               
  02c9  d1e3             shl bx, 1                                
  02cb  c787da5d0000     mov word ptr [bx + 0x5dda], 0            
  02d1  41               inc cx                                   
  02d2  83f908           cmp cx, 8                                
  02d5  7cf0             jl 0x2c7                                 
  02d7  b8042c           mov ax, 0x2c04                           
  02da  8ec0             mov es, ax                               
  02dc  268b0e8101       mov cx, word ptr es:[0x181]              
  02e1  e98100           jmp 0x365                                
  02e4  8bd9             mov bx, cx                               
  02e6  6bdb16           imul bx, bx, 0x16                        
  02e9  b81d1e           mov ax, 0x1e1d                           
  02ec  8ec0             mov es, ax                               
  02ee  2680bf858808     cmp byte ptr es:[bx - 0x777b], 8         
  02f4  7d6f             jge 0x365                                
  02f6  8bd9             mov bx, cx                               
  02f8  6bdb16           imul bx, bx, 0x16                        
  02fb  b81d1e           mov ax, 0x1e1d                           
  02fe  8ec0             mov es, ax                               
  0300  2683bf808800     cmp word ptr es:[bx - 0x7780], 0         
  0306  7c5d             jl 0x365                                 
  0308  8bd9             mov bx, cx                               
  030a  6bdb16           imul bx, bx, 0x16                        
  030d  b81d1e           mov ax, 0x1e1d                           
  0310  8ec0             mov es, ax                               
  0312  2683bf828800     cmp word ptr es:[bx - 0x777e], 0         
  0318  7c4b             jl 0x365                                 
  031a  8bd9             mov bx, cx                               
  031c  6bdb16           imul bx, bx, 0x16                        
  031f  b81d1e           mov ax, 0x1e1d                           
  0322  8ec0             mov es, ax                               
  0324  268a878b88       mov al, byte ptr es:[bx - 0x7775]        
  0329  98               cwde                                     
  032a  8bf0             mov si, ax                               
  032c  8bd9             mov bx, cx                               
  032e  6bdb16           imul bx, bx, 0x16                        
  0331  b81d1e           mov ax, 0x1e1d                           
  0334  8ec0             mov es, ax                               
  0336  26f7878c880010   test word ptr es:[bx - 0x7774], 0x1000   
  033d  740e             je 0x34d                                 
  033f  83fe04           cmp si, 4                                
  0342  7e04             jle 0x348                                
  0344  8bc6             mov ax, si                               
  0346  eb03             jmp 0x34b                                
  0348  b80400           mov ax, 4                                
  034b  8bf0             mov si, ax                               
  034d  8bd9             mov bx, cx                               
  034f  6bdb16           imul bx, bx, 0x16                        
  0352  b81d1e           mov ax, 0x1e1d                           
  0355  8ec0             mov es, ax                               
  0357  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  035c  98               cwde                                     
  035d  d1e0             shl ax, 1                                
  035f  8bd8             mov bx, ax                               
  0361  01b7da5d         add word ptr [bx + 0x5dda], si           
  0365  8bc1             mov ax, cx                               
  0367  49               dec cx                                   
  0368  0bc0             or ax, ax                                
  036a  7403             je 0x36f                                 
  036c  e975ff           jmp 0x2e4                                
  036f  5e               pop si                                   
  0370  5d               pop bp                                   
  0371  cb               retf                                     

ovl62_0372:  ; ENTRY
  0372  55               push bp                                  
  0373  8bec             mov bp, sp                               
  0375  56               push si                                  
  0376  33f6             xor si, si                               
  0378  eb0b             jmp 0x385                                
  037a  8bde             mov bx, si                               
  037c  d1e3             shl bx, 1                                
  037e  c787ca5d0000     mov word ptr [bx + 0x5dca], 0            
  0384  46               inc si                                   
  0385  83fe08           cmp si, 8                                
  0388  7cf0             jl 0x37a                                 
  038a  33f6             xor si, si                               
  038c  eb37             jmp 0x3c5                                
  038e  8bde             mov bx, si                               
  0390  6bdb41           imul bx, bx, 0x41                        
  0393  b8042c           mov ax, 0x2c04                           
  0396  8ec0             mov es, ax                               
  0398  2680bf921508     cmp byte ptr es:[bx + 0x1592], 8         
  039e  7d24             jge 0x3c4                                
  03a0  8bde             mov bx, si                               
  03a2  6bdb41           imul bx, bx, 0x41                        
  03a5  8ec0             mov es, ax                               
  03a7  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  03ac  98               cwde                                     
  03ad  d1e0             shl ax, 1                                
  03af  8bde             mov bx, si                               
  03b1  6bdb41           imul bx, bx, 0x41                        
  03b4  ba042c           mov dx, 0x2c04                           
  03b7  8ec2             mov es, dx                               
  03b9  268b97a715       mov dx, word ptr es:[bx + 0x15a7]        
  03be  8bd8             mov bx, ax                               
  03c0  0197ca5d         add word ptr [bx + 0x5dca], dx           
  03c4  46               inc si                                   
  03c5  b8042c           mov ax, 0x2c04                           
  03c8  8ec0             mov es, ax                               
  03ca  2639367b15       cmp word ptr es:[0x157b], si             
  03cf  7fbd             jg 0x38e                                 
  03d1  33f6             xor si, si                               
  03d3  eb1c             jmp 0x3f1                                
  03d5  56               push si                                  
  03d6  9a25001d30       lcall 0x301d, 0x25                       -> ovl35:07cf
  03db  59               pop cx                                   
  03dc  8bde             mov bx, si                               
  03de  d1e3             shl bx, 1                                
  03e0  50               push ax                                  
  03e1  8b87ea5d         mov ax, word ptr [bx + 0x5dea]           
  03e5  5a               pop dx                                   
  03e6  f7ea             imul dx                                  
  03e8  8bde             mov bx, si                               
  03ea  d1e3             shl bx, 1                                
  03ec  0187ca5d         add word ptr [bx + 0x5dca], ax           
  03f0  46               inc si                                   
  03f1  83fe08           cmp si, 8                                
  03f4  7cdf             jl 0x3d5                                 
  03f6  5e               pop si                                   
  03f7  5d               pop bp                                   
  03f8  cb               retf                                     

ovl62_03f9:  ; ENTRY
  03f9  55               push bp                                  
  03fa  8bec             mov bp, sp                               
  03fc  33d2             xor dx, dx                               
  03fe  eb0b             jmp 0x40b                                
  0400  8bda             mov bx, dx                               
  0402  d1e3             shl bx, 1                                
  0404  c787ea5d0000     mov word ptr [bx + 0x5dea], 0            
  040a  42               inc dx                                   
  040b  83fa08           cmp dx, 8                                
  040e  7cf0             jl 0x400                                 
  0410  33d2             xor dx, dx                               
  0412  eb28             jmp 0x43c                                
  0414  8bda             mov bx, dx                               
  0416  6bdb41           imul bx, bx, 0x41                        
  0419  b8042c           mov ax, 0x2c04                           
  041c  8ec0             mov es, ax                               
  041e  2680bf921508     cmp byte ptr es:[bx + 0x1592], 8         
  0424  7d15             jge 0x43b                                
  0426  8bda             mov bx, dx                               
  0428  6bdb41           imul bx, bx, 0x41                        
  042b  8ec0             mov es, ax                               
  042d  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0432  98               cwde                                     
  0433  d1e0             shl ax, 1                                
  0435  8bd8             mov bx, ax                               
  0437  ff87ea5d         inc word ptr [bx + 0x5dea]               
  043b  42               inc dx                                   
  043c  b8042c           mov ax, 0x2c04                           
  043f  8ec0             mov es, ax                               
  0441  2639167b15       cmp word ptr es:[0x157b], dx             
  0446  7fcc             jg 0x414                                 
  0448  5d               pop bp                                   
  0449  cb               retf                                     

ovl62_044a:  ; ENTRY
  044a  55               push bp                                  
  044b  8bec             mov bp, sp                               
  044d  56               push si                                  
  044e  57               push di                                  
  044f  8b7606           mov si, word ptr [bp + 6]                
  0452  8b7e08           mov di, word ptr [bp + 8]                
  0455  33c9             xor cx, cx                               
  0457  eb49             jmp 0x4a2                                
  0459  8bd9             mov bx, cx                               
  045b  6bdb41           imul bx, bx, 0x41                        
  045e  b8042c           mov ax, 0x2c04                           
  0461  8ec0             mov es, ax                               
  0463  2639b77d15       cmp word ptr es:[bx + 0x157d], si        
  0468  7411             je 0x47b                                 
  046a  8bd9             mov bx, cx                               
  046c  6bdb41           imul bx, bx, 0x41                        
  046f  8bd6             mov dx, si                               
  0471  4a               dec dx                                   
  0472  8ec0             mov es, ax                               
  0474  2639977d15       cmp word ptr es:[bx + 0x157d], dx        
  0479  7526             jne 0x4a1                                
  047b  8bd9             mov bx, cx                               
  047d  6bdb41           imul bx, bx, 0x41                        
  0480  b8042c           mov ax, 0x2c04                           
  0483  8ec0             mov es, ax                               
  0485  2639bf7f15       cmp word ptr es:[bx + 0x157f], di        
  048a  7411             je 0x49d                                 
  048c  8bd9             mov bx, cx                               
  048e  6bdb41           imul bx, bx, 0x41                        
  0491  8bd7             mov dx, di                               
  0493  4a               dec dx                                   
  0494  8ec0             mov es, ax                               
  0496  2639977f15       cmp word ptr es:[bx + 0x157f], dx        
  049b  7504             jne 0x4a1                                
  049d  8bc1             mov ax, cx                               
  049f  eb10             jmp 0x4b1                                
  04a1  41               inc cx                                   
  04a2  b8042c           mov ax, 0x2c04                           
  04a5  8ec0             mov es, ax                               
  04a7  26390e7b15       cmp word ptr es:[0x157b], cx             
  04ac  7fab             jg 0x459                                 
  04ae  b8ffff           mov ax, 0xffff                           
  04b1  5f               pop di                                   
  04b2  5e               pop si                                   
  04b3  5d               pop bp                                   
  04b4  cb               retf                                     

ovl62_04b5:  ; ENTRY
  04b5  55               push bp                                  
  04b6  8bec             mov bp, sp                               
  04b8  33d2             xor dx, dx                               
  04ba  eb2d             jmp 0x4e9                                
  04bc  8bda             mov bx, dx                               
  04be  6bdb1f           imul bx, bx, 0x1f                        
  04c1  b8042c           mov ax, 0x2c04                           
  04c4  8ec0             mov es, ax                               
  04c6  268b871108       mov ax, word ptr es:[bx + 0x811]         
  04cb  3b4606           cmp ax, word ptr [bp + 6]                
  04ce  7518             jne 0x4e8                                
  04d0  8bda             mov bx, dx                               
  04d2  6bdb1f           imul bx, bx, 0x1f                        
  04d5  b8042c           mov ax, 0x2c04                           
  04d8  8ec0             mov es, ax                               
  04da  268b871308       mov ax, word ptr es:[bx + 0x813]         
  04df  3b4608           cmp ax, word ptr [bp + 8]                
  04e2  7504             jne 0x4e8                                
  04e4  8bc2             mov ax, dx                               
  04e6  eb10             jmp 0x4f8                                
  04e8  42               inc dx                                   
  04e9  b8042c           mov ax, 0x2c04                           
  04ec  8ec0             mov es, ax                               
  04ee  2639160f08       cmp word ptr es:[0x80f], dx              
  04f3  7fc7             jg 0x4bc                                 
  04f5  b8ffff           mov ax, 0xffff                           
  04f8  5d               pop bp                                   
  04f9  cb               retf                                     

ovl62_04fa:  ; ENTRY
  04fa  55               push bp                                  
  04fb  8bec             mov bp, sp                               
  04fd  83ec04           sub sp, 4                                
  0500  56               push si                                  
  0501  57               push di                                  
  0502  8b7e0a           mov di, word ptr [bp + 0xa]              
  0505  c746feffff       mov word ptr [bp - 2], 0xffff            
  050a  c746fce803       mov word ptr [bp - 4], 0x3e8             
  050f  33f6             xor si, si                               
  0511  e92701           jmp 0x63b                                
  0514  b8042c           mov ax, 0x2c04                           
  0517  8ec0             mov es, ax                               
  0519  26833e240100     cmp word ptr es:[0x124], 0               
  051f  7503             jne 0x524                                
  0521  e9c400           jmp 0x5e8                                
  0524  837e0c00         cmp word ptr [bp + 0xc], 0               
  0528  7503             jne 0x52d                                
  052a  e9bb00           jmp 0x5e8                                
  052d  8bde             mov bx, si                               
  052f  6bdb41           imul bx, bx, 0x41                        
  0532  b8042c           mov ax, 0x2c04                           
  0535  8ec0             mov es, ax                               
  0537  26ffb77f15       push word ptr es:[bx + 0x157f]           
  053c  8bde             mov bx, si                               
  053e  6bdb41           imul bx, bx, 0x41                        
  0541  b8042c           mov ax, 0x2c04                           
  0544  8ec0             mov es, ax                               
  0546  26ffb77d15       push word ptr es:[bx + 0x157d]           
  054b  6a01             push 1                                   
  054d  9aa200f930       lcall 0x30f9, 0xa2                       -> ovl64:15ff
  0552  83c406           add sp, 6                                
  0555  0bc0             or ax, ax                                
  0557  7403             je 0x55c                                 
  0559  e98c00           jmp 0x5e8                                
  055c  8bde             mov bx, si                               
  055e  6bdb41           imul bx, bx, 0x41                        
  0561  b8042c           mov ax, 0x2c04                           
  0564  8ec0             mov es, ax                               
  0566  26ffb77f15       push word ptr es:[bx + 0x157f]           
  056b  8bde             mov bx, si                               
  056d  6bdb41           imul bx, bx, 0x41                        
  0570  b8042c           mov ax, 0x2c04                           
  0573  8ec0             mov es, ax                               
  0575  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  057a  40               inc ax                                   
  057b  50               push ax                                  
  057c  6a01             push 1                                   
  057e  9aa200f930       lcall 0x30f9, 0xa2                       -> ovl64:15ff
  0583  83c406           add sp, 6                                
  0586  0bc0             or ax, ax                                
  0588  755e             jne 0x5e8                                
  058a  8bde             mov bx, si                               
  058c  6bdb41           imul bx, bx, 0x41                        
  058f  b8042c           mov ax, 0x2c04                           
  0592  8ec0             mov es, ax                               
  0594  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0599  40               inc ax                                   
  059a  50               push ax                                  
  059b  8bde             mov bx, si                               
  059d  6bdb41           imul bx, bx, 0x41                        
  05a0  b8042c           mov ax, 0x2c04                           
  05a3  8ec0             mov es, ax                               
  05a5  26ffb77d15       push word ptr es:[bx + 0x157d]           
  05aa  6a01             push 1                                   
  05ac  9aa200f930       lcall 0x30f9, 0xa2                       -> ovl64:15ff
  05b1  83c406           add sp, 6                                
  05b4  0bc0             or ax, ax                                
  05b6  7530             jne 0x5e8                                
  05b8  8bde             mov bx, si                               
  05ba  6bdb41           imul bx, bx, 0x41                        
  05bd  b8042c           mov ax, 0x2c04                           
  05c0  8ec0             mov es, ax                               
  05c2  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  05c7  40               inc ax                                   
  05c8  50               push ax                                  
  05c9  8bde             mov bx, si                               
  05cb  6bdb41           imul bx, bx, 0x41                        
  05ce  b8042c           mov ax, 0x2c04                           
  05d1  8ec0             mov es, ax                               
  05d3  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  05d8  40               inc ax                                   
  05d9  50               push ax                                  
  05da  6a01             push 1                                   
  05dc  9aa200f930       lcall 0x30f9, 0xa2                       -> ovl64:15ff
  05e1  83c406           add sp, 6                                
  05e4  0bc0             or ax, ax                                
  05e6  7452             je 0x63a                                 
  05e8  8bde             mov bx, si                               
  05ea  6bdb41           imul bx, bx, 0x41                        
  05ed  b8042c           mov ax, 0x2c04                           
  05f0  8ec0             mov es, ax                               
  05f2  26ffb77f15       push word ptr es:[bx + 0x157f]           
  05f7  8bde             mov bx, si                               
  05f9  6bdb41           imul bx, bx, 0x41                        
  05fc  b8042c           mov ax, 0x2c04                           
  05ff  8ec0             mov es, ax                               
  0601  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0606  ff7608           push word ptr [bp + 8]                   
  0609  ff7606           push word ptr [bp + 6]                   
  060c  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  0611  83c408           add sp, 8                                
  0614  8bd0             mov dx, ax                               
  0616  3b56fc           cmp dx, word ptr [bp - 4]                
  0619  7d1f             jge 0x63a                                
  061b  83ff0e           cmp di, 0xe                              
  061e  7414             je 0x634                                 
  0620  8bde             mov bx, si                               
  0622  6bdb41           imul bx, bx, 0x41                        
  0625  b8042c           mov ax, 0x2c04                           
  0628  8ec0             mov es, ax                               
  062a  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  062f  98               cwde                                     
  0630  3bc7             cmp ax, di                               
  0632  7506             jne 0x63a                                
  0634  8956fc           mov word ptr [bp - 4], dx                
  0637  8976fe           mov word ptr [bp - 2], si                
  063a  46               inc si                                   
  063b  b8042c           mov ax, 0x2c04                           
  063e  8ec0             mov es, ax                               
  0640  2639367b15       cmp word ptr es:[0x157b], si             
  0645  7e03             jle 0x64a                                
  0647  e9cafe           jmp 0x514                                
  064a  8b46fe           mov ax, word ptr [bp - 2]                
  064d  5f               pop di                                   
  064e  5e               pop si                                   
  064f  c9               leave                                    
  0650  cb               retf                                     

ovl62_0651:  ; ENTRY
  0651  55               push bp                                  
  0652  8bec             mov bp, sp                               
  0654  83ec0e           sub sp, 0xe                              
  0657  56               push si                                  
  0658  57               push di                                  
  0659  8b7606           mov si, word ptr [bp + 6]                
  065c  8b7e08           mov di, word ptr [bp + 8]                
  065f  6a00             push 0                                   
  0661  b8042c           mov ax, 0x2c04                           
  0664  8ec0             mov es, ax                               
  0666  26ff361001       push word ptr es:[0x110]                 
  066b  57               push di                                  
  066c  56               push si                                  
  066d  0e               push cs                                  
  066e  e889fe           call 0x4fa                               
  0671  83c408           add sp, 8                                
  0674  8946fe           mov word ptr [bp - 2], ax                
  0677  16               push ss                                  
  0678  8d46fa           lea ax, [bp - 6]                         
  067b  50               push ax                                  
  067c  16               push ss                                  
  067d  8d46fc           lea ax, [bp - 4]                         
  0680  50               push ax                                  
  0681  b8042c           mov ax, 0x2c04                           
  0684  8ec0             mov es, ax                               
  0686  26ff361001       push word ptr es:[0x110]                 
  068b  9a57007330       lcall 0x3073, 0x57                       -> ovl47:0b47
  0690  83c40a           add sp, 0xa                              
  0693  8946f6           mov word ptr [bp - 0xa], ax              
  0696  8b46fe           mov ax, word ptr [bp - 2]                
  0699  8946f8           mov word ptr [bp - 8], ax                
  069c  837ef600         cmp word ptr [bp - 0xa], 0               
  06a0  7454             je 0x6f6                                 
  06a2  8b5efe           mov bx, word ptr [bp - 2]                
  06a5  6bdb41           imul bx, bx, 0x41                        
  06a8  b8042c           mov ax, 0x2c04                           
  06ab  8ec0             mov es, ax                               
  06ad  26ffb77f15       push word ptr es:[bx + 0x157f]           
  06b2  8b5efe           mov bx, word ptr [bp - 2]                
  06b5  6bdb41           imul bx, bx, 0x41                        
  06b8  b8042c           mov ax, 0x2c04                           
  06bb  8ec0             mov es, ax                               
  06bd  26ffb77d15       push word ptr es:[bx + 0x157d]           
  06c2  57               push di                                  
  06c3  56               push si                                  
  06c4  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  06c9  83c408           add sp, 8                                
  06cc  8946f4           mov word ptr [bp - 0xc], ax              
  06cf  ff76fa           push word ptr [bp - 6]                   
  06d2  ff76fc           push word ptr [bp - 4]                   
  06d5  57               push di                                  
  06d6  56               push si                                  
  06d7  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  06dc  83c408           add sp, 8                                
  06df  8946f2           mov word ptr [bp - 0xe], ax              
  06e2  3b46f4           cmp ax, word ptr [bp - 0xc]              
  06e5  7d0f             jge 0x6f6                                
  06e7  b8042c           mov ax, 0x2c04                           
  06ea  8ec0             mov es, ax                               
  06ec  26a11001         mov ax, word ptr es:[0x110]              
  06f0  056400           add ax, 0x64                             
  06f3  8946f8           mov word ptr [bp - 8], ax                
  06f6  8b46f8           mov ax, word ptr [bp - 8]                
  06f9  5f               pop di                                   
  06fa  5e               pop si                                   
  06fb  c9               leave                                    
  06fc  cb               retf                                     

ovl62_06fd:  ; ENTRY
  06fd  55               push bp                                  
  06fe  8bec             mov bp, sp                               
  0700  83ec02           sub sp, 2                                
  0703  56               push si                                  
  0704  57               push di                                  
  0705  bfffff           mov di, 0xffff                           
  0708  c746fee803       mov word ptr [bp - 2], 0x3e8             
  070d  33f6             xor si, si                               
  070f  e99800           jmp 0x7aa                                
  0712  8bde             mov bx, si                               
  0714  6bdb1f           imul bx, bx, 0x1f                        
  0717  b8042c           mov ax, 0x2c04                           
  071a  ba042c           mov dx, 0x2c04                           
  071d  8ec2             mov es, dx                               
  071f  268a0e1001       mov cl, byte ptr es:[0x110]              
  0724  ba0100           mov dx, 1                                
  0727  d3e2             shl dx, cl                               
  0729  8ec0             mov es, ax                               
  072b  2685972e08       test word ptr es:[bx + 0x82e], dx        
  0730  7477             je 0x7a9                                 
  0732  b8042c           mov ax, 0x2c04                           
  0735  8ec0             mov es, ax                               
  0737  26833e240100     cmp word ptr es:[0x124], 0               
  073d  7432             je 0x771                                 
  073f  837e0a00         cmp word ptr [bp + 0xa], 0               
  0743  742c             je 0x771                                 
  0745  8bde             mov bx, si                               
  0747  6bdb1f           imul bx, bx, 0x1f                        
  074a  b8042c           mov ax, 0x2c04                           
  074d  8ec0             mov es, ax                               
  074f  26ffb71308       push word ptr es:[bx + 0x813]            
  0754  8bde             mov bx, si                               
  0756  6bdb1f           imul bx, bx, 0x1f                        
  0759  b8042c           mov ax, 0x2c04                           
  075c  8ec0             mov es, ax                               
  075e  26ffb71108       push word ptr es:[bx + 0x811]            
  0763  6a01             push 1                                   
  0765  9aa200f930       lcall 0x30f9, 0xa2                       -> ovl64:15ff
  076a  83c406           add sp, 6                                
  076d  0bc0             or ax, ax                                
  076f  7438             je 0x7a9                                 
  0771  8bde             mov bx, si                               
  0773  6bdb1f           imul bx, bx, 0x1f                        
  0776  b8042c           mov ax, 0x2c04                           
  0779  8ec0             mov es, ax                               
  077b  26ffb71308       push word ptr es:[bx + 0x813]            
  0780  8bde             mov bx, si                               
  0782  6bdb1f           imul bx, bx, 0x1f                        
  0785  b8042c           mov ax, 0x2c04                           
  0788  8ec0             mov es, ax                               
  078a  26ffb71108       push word ptr es:[bx + 0x811]            
  078f  ff7608           push word ptr [bp + 8]                   
  0792  ff7606           push word ptr [bp + 6]                   
  0795  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  079a  83c408           add sp, 8                                
  079d  8bd0             mov dx, ax                               
  079f  3b56fe           cmp dx, word ptr [bp - 2]                
  07a2  7d05             jge 0x7a9                                
  07a4  8956fe           mov word ptr [bp - 2], dx                
  07a7  8bfe             mov di, si                               
  07a9  46               inc si                                   
  07aa  b8042c           mov ax, 0x2c04                           
  07ad  8ec0             mov es, ax                               
  07af  2639360f08       cmp word ptr es:[0x80f], si              
  07b4  7e03             jle 0x7b9                                
  07b6  e959ff           jmp 0x712                                
  07b9  8bc7             mov ax, di                               
  07bb  5f               pop di                                   
  07bc  5e               pop si                                   
  07bd  c9               leave                                    
  07be  cb               retf                                     

ovl62_07bf:  ; ENTRY
  07bf  55               push bp                                  
  07c0  8bec             mov bp, sp                               
  07c2  8b5606           mov dx, word ptr [bp + 6]                
  07c5  ff7608           push word ptr [bp + 8]                   
  07c8  8bda             mov bx, dx                               
  07ca  6bdb41           imul bx, bx, 0x41                        
  07cd  b8042c           mov ax, 0x2c04                           
  07d0  8ec0             mov es, ax                               
  07d2  26ffb77f15       push word ptr es:[bx + 0x157f]           
  07d7  8bda             mov bx, dx                               
  07d9  6bdb41           imul bx, bx, 0x41                        
  07dc  b8042c           mov ax, 0x2c04                           
  07df  8ec0             mov es, ax                               
  07e1  26ffb77d15       push word ptr es:[bx + 0x157d]           
  07e6  90               nop                                      
  07e7  0e               push cs                                  
  07e8  e8e200           call 0x8cd                               
  07eb  83c406           add sp, 6                                
  07ee  5d               pop bp                                   
  07ef  cb               retf                                     

ovl62_07f0:  ; ENTRY
  07f0  55               push bp                                  
  07f1  8bec             mov bp, sp                               
  07f3  ff760a           push word ptr [bp + 0xa]                 
  07f6  ff7608           push word ptr [bp + 8]                   
  07f9  ff7606           push word ptr [bp + 6]                   
  07fc  90               nop                                      
  07fd  0e               push cs                                  
  07fe  e8cc00           call 0x8cd                               
  0801  83c406           add sp, 6                                
  0804  5d               pop bp                                   
  0805  cb               retf                                     

ovl62_0806:  ; ENTRY
  0806  55               push bp                                  
  0807  8bec             mov bp, sp                               
  0809  8b5606           mov dx, word ptr [bp + 6]                
  080c  ff7608           push word ptr [bp + 8]                   
  080f  8bda             mov bx, dx                               
  0811  6bdb1f           imul bx, bx, 0x1f                        
  0814  b8042c           mov ax, 0x2c04                           
  0817  8ec0             mov es, ax                               
  0819  26ffb71308       push word ptr es:[bx + 0x813]            
  081e  8bda             mov bx, dx                               
  0820  6bdb1f           imul bx, bx, 0x1f                        
  0823  b8042c           mov ax, 0x2c04                           
  0826  8ec0             mov es, ax                               
  0828  26ffb71108       push word ptr es:[bx + 0x811]            
  082d  90               nop                                      
  082e  0e               push cs                                  
  082f  e89b00           call 0x8cd                               
  0832  83c406           add sp, 6                                
  0835  5d               pop bp                                   
  0836  cb               retf                                     

ovl62_0837:  ; ENTRY
  0837  55               push bp                                  
  0838  8bec             mov bp, sp                               
  083a  8b5606           mov dx, word ptr [bp + 6]                
  083d  ff7608           push word ptr [bp + 8]                   
  0840  8bda             mov bx, dx                               
  0842  6bdb41           imul bx, bx, 0x41                        
  0845  b8042c           mov ax, 0x2c04                           
  0848  8ec0             mov es, ax                               
  084a  26ffb77f15       push word ptr es:[bx + 0x157f]           
  084f  8bda             mov bx, dx                               
  0851  6bdb41           imul bx, bx, 0x41                        
  0854  b8042c           mov ax, 0x2c04                           
  0857  8ec0             mov es, ax                               
  0859  26ffb77d15       push word ptr es:[bx + 0x157d]           
  085e  90               nop                                      
  085f  0e               push cs                                  
  0860  e83b01           call 0x99e                               
  0863  83c406           add sp, 6                                
  0866  5d               pop bp                                   
  0867  cb               retf                                     

ovl62_0868:  ; ENTRY
  0868  55               push bp                                  
  0869  8bec             mov bp, sp                               
  086b  8b5606           mov dx, word ptr [bp + 6]                
  086e  ff7608           push word ptr [bp + 8]                   
  0871  8bda             mov bx, dx                               
  0873  6bdb1f           imul bx, bx, 0x1f                        
  0876  b8042c           mov ax, 0x2c04                           
  0879  8ec0             mov es, ax                               
  087b  26ffb71308       push word ptr es:[bx + 0x813]            
  0880  8bda             mov bx, dx                               
  0882  6bdb1f           imul bx, bx, 0x1f                        
  0885  b8042c           mov ax, 0x2c04                           
  0888  8ec0             mov es, ax                               
  088a  26ffb71108       push word ptr es:[bx + 0x811]            
  088f  90               nop                                      
  0890  0e               push cs                                  
  0891  e80a01           call 0x99e                               
  0894  83c406           add sp, 6                                
  0897  5d               pop bp                                   
  0898  cb               retf                                     

ovl62_0899:  ; ENTRY
  0899  55               push bp                                  
  089a  8bec             mov bp, sp                               
  089c  ff760a           push word ptr [bp + 0xa]                 
  089f  c45e06           les bx, ptr [bp + 6]                     
  08a2  26ff7702         push word ptr es:[bx + 2]                
  08a6  26ff37           push word ptr es:[bx]                    
  08a9  90               nop                                      
  08aa  0e               push cs                                  
  08ab  e81f00           call 0x8cd                               
  08ae  83c406           add sp, 6                                
  08b1  5d               pop bp                                   
  08b2  cb               retf                                     

ovl62_08b3:  ; ENTRY
  08b3  55               push bp                                  
  08b4  8bec             mov bp, sp                               
  08b6  ff760a           push word ptr [bp + 0xa]                 
  08b9  c45e06           les bx, ptr [bp + 6]                     
  08bc  26ff7702         push word ptr es:[bx + 2]                
  08c0  26ff37           push word ptr es:[bx]                    
  08c3  90               nop                                      
  08c4  0e               push cs                                  
  08c5  e8d600           call 0x99e                               
  08c8  83c406           add sp, 6                                
  08cb  5d               pop bp                                   
  08cc  cb               retf                                     

ovl62_08cd:  ; ENTRY
  08cd  55               push bp                                  
  08ce  8bec             mov bp, sp                               
  08d0  83ec0a           sub sp, 0xa                              
  08d3  56               push si                                  
  08d4  57               push di                                  
  08d5  8b5606           mov dx, word ptr [bp + 6]                
  08d8  8b4e08           mov cx, word ptr [bp + 8]                
  08db  c746fe0000       mov word ptr [bp - 2], 0                 
  08e0  b8042c           mov ax, 0x2c04                           
  08e3  8ec0             mov es, ax                               
  08e5  26833e240100     cmp word ptr es:[0x124], 0               
  08eb  741e             je 0x90b                                 
  08ed  8bd9             mov bx, cx                               
  08ef  6bdb70           imul bx, bx, 0x70                        
  08f2  03da             add bx, dx                               
  08f4  b8d919           mov ax, 0x19d9                           
  08f7  8ec0             mov es, ax                               
  08f9  268a870000       mov al, byte ptr es:[bx]                 
  08fe  c1e805           shr ax, 5                                
  0901  250100           and ax, 1                                
  0904  0bc0             or ax, ax                                
  0906  7503             jne 0x90b                                
  0908  e98f00           jmp 0x99a                                
  090b  8bf2             mov si, dx                               
  090d  d1e6             shl si, 1                                
  090f  4e               dec si                                   
  0910  8bf9             mov di, cx                               
  0912  d1e7             shl di, 1                                
  0914  4f               dec di                                   
  0915  ff760a           push word ptr [bp + 0xa]                 
  0918  666804000400     push 0x40004                             
  091e  8bc7             mov ax, di                               
  0920  40               inc ax                                   
  0921  50               push ax                                  
  0922  8bc6             mov ax, si                               
  0924  40               inc ax                                   
  0925  50               push ax                                  
  0926  16               push ss                                  
  0927  8d46f6           lea ax, [bp - 0xa]                       
  092a  50               push ax                                  
  092b  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0930  83c40c           add sp, 0xc                              
  0933  52               push dx                                  
  0934  50               push ax                                  
  0935  1e               push ds                                  
  0936  689567           push 0x6795                              
  0939  9a9704d014       lcall 0x14d0, 0x497                      -> 14d0:0497
  093e  83c40a           add sp, 0xa                              
  0941  ff76fe           push word ptr [bp - 2]                   
  0944  6a06             push 6                                   
  0946  57               push di                                  
  0947  56               push si                                  
  0948  1e               push ds                                  
  0949  689567           push 0x6795                              
  094c  9ab70b1210       lcall 0x1012, 0xbb7                      -> 1012:0bb7
  0951  83c40c           add sp, 0xc                              
  0954  ff76fe           push word ptr [bp - 2]                   
  0957  6a04             push 4                                   
  0959  8bc7             mov ax, di                               
  095b  050500           add ax, 5                                
  095e  50               push ax                                  
  095f  8bc6             mov ax, si                               
  0961  40               inc ax                                   
  0962  50               push ax                                  
  0963  1e               push ds                                  
  0964  689567           push 0x6795                              
  0967  9ab70b1210       lcall 0x1012, 0xbb7                      -> 1012:0bb7
  096c  83c40c           add sp, 0xc                              
  096f  ff76fe           push word ptr [bp - 2]                   
  0972  6a05             push 5                                   
  0974  57               push di                                  
  0975  56               push si                                  
  0976  1e               push ds                                  
  0977  689567           push 0x6795                              
  097a  9a080f1210       lcall 0x1012, 0xf08                      -> 1012:0f08
  097f  83c40c           add sp, 0xc                              
  0982  ff76fe           push word ptr [bp - 2]                   
  0985  6a05             push 5                                   
  0987  57               push di                                  
  0988  8bc6             mov ax, si                               
  098a  050500           add ax, 5                                
  098d  50               push ax                                  
  098e  1e               push ds                                  
  098f  689567           push 0x6795                              
  0992  9a080f1210       lcall 0x1012, 0xf08                      -> 1012:0f08
  0997  83c40c           add sp, 0xc                              
  099a  5f               pop di                                   
  099b  5e               pop si                                   
  099c  c9               leave                                    
  099d  cb               retf                                     

ovl62_099e:  ; ENTRY
  099e  55               push bp                                  
  099f  8bec             mov bp, sp                               
  09a1  83ec02           sub sp, 2                                
  09a4  56               push si                                  
  09a5  57               push di                                  
  09a6  8b5606           mov dx, word ptr [bp + 6]                
  09a9  8b4e08           mov cx, word ptr [bp + 8]                
  09ac  8b760a           mov si, word ptr [bp + 0xa]              
  09af  b8042c           mov ax, 0x2c04                           
  09b2  8ec0             mov es, ax                               
  09b4  26833e240100     cmp word ptr es:[0x124], 0               
  09ba  741b             je 0x9d7                                 
  09bc  8bd9             mov bx, cx                               
  09be  6bdb70           imul bx, bx, 0x70                        
  09c1  03da             add bx, dx                               
  09c3  b8d919           mov ax, 0x19d9                           
  09c6  8ec0             mov es, ax                               
  09c8  268a870000       mov al, byte ptr es:[bx]                 
  09cd  c1e805           shr ax, 5                                
  09d0  250100           and ax, 1                                
  09d3  0bc0             or ax, ax                                
  09d5  7464             je 0xa3b                                 
  09d7  8bfa             mov di, dx                               
  09d9  d1e7             shl di, 1                                
  09db  83c7fe           add di, -2                               
  09de  8bc1             mov ax, cx                               
  09e0  d1e0             shl ax, 1                                
  09e2  05feff           add ax, 0xfffe                           
  09e5  8946fe           mov word ptr [bp - 2], ax                
  09e8  56               push si                                  
  09e9  6a08             push 8                                   
  09eb  50               push ax                                  
  09ec  57               push di                                  
  09ed  1e               push ds                                  
  09ee  689567           push 0x6795                              
  09f1  9ab70b1210       lcall 0x1012, 0xbb7                      -> 1012:0bb7
  09f6  83c40c           add sp, 0xc                              
  09f9  56               push si                                  
  09fa  6a08             push 8                                   
  09fc  8b46fe           mov ax, word ptr [bp - 2]                
  09ff  050700           add ax, 7                                
  0a02  50               push ax                                  
  0a03  57               push di                                  
  0a04  1e               push ds                                  
  0a05  689567           push 0x6795                              
  0a08  9ab70b1210       lcall 0x1012, 0xbb7                      -> 1012:0bb7
  0a0d  83c40c           add sp, 0xc                              
  0a10  56               push si                                  
  0a11  6a08             push 8                                   
  0a13  ff76fe           push word ptr [bp - 2]                   
  0a16  57               push di                                  
  0a17  1e               push ds                                  
  0a18  689567           push 0x6795                              
  0a1b  9a080f1210       lcall 0x1012, 0xf08                      -> 1012:0f08
  0a20  83c40c           add sp, 0xc                              
  0a23  56               push si                                  
  0a24  6a08             push 8                                   
  0a26  ff76fe           push word ptr [bp - 2]                   
  0a29  8bc7             mov ax, di                               
  0a2b  050700           add ax, 7                                
  0a2e  50               push ax                                  
  0a2f  1e               push ds                                  
  0a30  689567           push 0x6795                              
  0a33  9a080f1210       lcall 0x1012, 0xf08                      -> 1012:0f08
  0a38  83c40c           add sp, 0xc                              
  0a3b  5f               pop di                                   
  0a3c  5e               pop si                                   
  0a3d  c9               leave                                    
  0a3e  cb               retf                                     

ovl62_0a3f:  ; ENTRY
  0a3f  55               push bp                                  
  0a40  8bec             mov bp, sp                               
  0a42  83ec08           sub sp, 8                                
  0a45  56               push si                                  
  0a46  57               push di                                  
  0a47  8b5606           mov dx, word ptr [bp + 6]                
  0a4a  8b4e08           mov cx, word ptr [bp + 8]                
  0a4d  8b760a           mov si, word ptr [bp + 0xa]              
  0a50  8b7e0c           mov di, word ptr [bp + 0xc]              
  0a53  b8042c           mov ax, 0x2c04                           
  0a56  8ec0             mov es, ax                               
  0a58  26833e240100     cmp word ptr es:[0x124], 0               
  0a5e  741b             je 0xa7b                                 
  0a60  8bd9             mov bx, cx                               
  0a62  6bdb70           imul bx, bx, 0x70                        
  0a65  03da             add bx, dx                               
  0a67  b8d919           mov ax, 0x19d9                           
  0a6a  8ec0             mov es, ax                               
  0a6c  268a870000       mov al, byte ptr es:[bx]                 
  0a71  c1e805           shr ax, 5                                
  0a74  250100           and ax, 1                                
  0a77  0bc0             or ax, ax                                
  0a79  7474             je 0xaef                                 
  0a7b  b8042c           mov ax, 0x2c04                           
  0a7e  8ec0             mov es, ax                               
  0a80  26833e240100     cmp word ptr es:[0x124], 0               
  0a86  741b             je 0xaa3                                 
  0a88  8bdf             mov bx, di                               
  0a8a  6bdb70           imul bx, bx, 0x70                        
  0a8d  03de             add bx, si                               
  0a8f  b8d919           mov ax, 0x19d9                           
  0a92  8ec0             mov es, ax                               
  0a94  268a870000       mov al, byte ptr es:[bx]                 
  0a99  c1e805           shr ax, 5                                
  0a9c  250100           and ax, 1                                
  0a9f  0bc0             or ax, ax                                
  0aa1  744c             je 0xaef                                 
  0aa3  8bc2             mov ax, dx                               
  0aa5  d1e0             shl ax, 1                                
  0aa7  05feff           add ax, 0xfffe                           
  0aaa  8946fe           mov word ptr [bp - 2], ax                
  0aad  8bc1             mov ax, cx                               
  0aaf  d1e0             shl ax, 1                                
  0ab1  05feff           add ax, 0xfffe                           
  0ab4  8946fc           mov word ptr [bp - 4], ax                
  0ab7  8bc6             mov ax, si                               
  0ab9  d1e0             shl ax, 1                                
  0abb  05feff           add ax, 0xfffe                           
  0abe  8946fa           mov word ptr [bp - 6], ax                
  0ac1  8bc7             mov ax, di                               
  0ac3  d1e0             shl ax, 1                                
  0ac5  05feff           add ax, 0xfffe                           
  0ac8  8946f8           mov word ptr [bp - 8], ax                
  0acb  ff760e           push word ptr [bp + 0xe]                 
  0ace  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0ad3  59               pop cx                                   
  0ad4  666a00           push 0                                   
  0ad7  ff76f8           push word ptr [bp - 8]                   
  0ada  ff76fa           push word ptr [bp - 6]                   
  0add  ff76fc           push word ptr [bp - 4]                   
  0ae0  ff76fe           push word ptr [bp - 2]                   
  0ae3  1e               push ds                                  
  0ae4  689567           push 0x6795                              
  0ae7  9ab8003311       lcall 0x1133, 0xb8                       -> 1133:00b8
  0aec  83c410           add sp, 0x10                             
  0aef  5f               pop di                                   
  0af0  5e               pop si                                   
  0af1  c9               leave                                    
  0af2  cb               retf                                     

ovl62_0af3:  ; ENTRY
  0af3  55               push bp                                  
  0af4  8bec             mov bp, sp                               
  0af6  9a3d007b07       lcall 0x77b, 0x3d                        -> 077b:003d
  0afb  5d               pop bp                                   
  0afc  cb               retf                                     

ovl62_0afd:  ; ENTRY
  0afd  55               push bp                                  
  0afe  8bec             mov bp, sp                               
  0b00  b8042c           mov ax, 0x2c04                           
  0b03  8ec0             mov es, ax                               
  0b05  268b1e1001       mov bx, word ptr es:[0x110]              
  0b0a  d1e3             shl bx, 1                                
  0b0c  ffb76c2b         push word ptr [bx + 0x2b6c]              
  0b10  6a01             push 1                                   
  0b12  ff7608           push word ptr [bp + 8]                   
  0b15  ff7606           push word ptr [bp + 6]                   
  0b18  9a20007b07       lcall 0x77b, 0x20                        -> 077b:0020
  0b1d  83c408           add sp, 8                                
  0b20  9a5f007b07       lcall 0x77b, 0x5f                        -> 077b:005f
  0b25  5d               pop bp                                   
  0b26  cb               retf                                     

ovl62_0b27:  ; ENTRY
  0b27  55               push bp                                  
  0b28  8bec             mov bp, sp                               
  0b2a  b8042c           mov ax, 0x2c04                           
  0b2d  8ec0             mov es, ax                               
  0b2f  268b1e1001       mov bx, word ptr es:[0x110]              
  0b34  d1e3             shl bx, 1                                
  0b36  ffb76c2b         push word ptr [bx + 0x2b6c]              
  0b3a  6a02             push 2                                   
  0b3c  ff7608           push word ptr [bp + 8]                   
  0b3f  ff7606           push word ptr [bp + 6]                   
  0b42  9a20007b07       lcall 0x77b, 0x20                        -> 077b:0020
  0b47  83c408           add sp, 8                                
  0b4a  9a5f007b07       lcall 0x77b, 0x5f                        -> 077b:005f
  0b4f  5d               pop bp                                   
  0b50  cb               retf                                     

ovl62_0b51:  ; ENTRY
  0b51  55               push bp                                  
  0b52  8bec             mov bp, sp                               
  0b54  56               push si                                  
  0b55  8b5606           mov dx, word ptr [bp + 6]                
  0b58  8b5e08           mov bx, word ptr [bp + 8]                
  0b5b  8b4e0a           mov cx, word ptr [bp + 0xa]              
  0b5e  8b760c           mov si, word ptr [bp + 0xc]              
  0b61  3bd1             cmp dx, cx                               
  0b63  750d             jne 0xb72                                
  0b65  3bde             cmp bx, si                               
  0b67  7c04             jl 0xb6d                                 
  0b69  33c0             xor ax, ax                               
  0b6b  eb03             jmp 0xb70                                
  0b6d  b80400           mov ax, 4                                
  0b70  eb48             jmp 0xbba                                
  0b72  3bde             cmp bx, si                               
  0b74  750e             jne 0xb84                                
  0b76  3bd1             cmp dx, cx                               
  0b78  7c05             jl 0xb7f                                 
  0b7a  b80600           mov ax, 6                                
  0b7d  ebf1             jmp 0xb70                                
  0b7f  b80200           mov ax, 2                                
  0b82  ebec             jmp 0xb70                                
  0b84  3bd1             cmp dx, cx                               
  0b86  7e09             jle 0xb91                                
  0b88  3bde             cmp bx, si                               
  0b8a  7e05             jle 0xb91                                
  0b8c  b80700           mov ax, 7                                
  0b8f  eb29             jmp 0xbba                                
  0b91  3bd1             cmp dx, cx                               
  0b93  7e09             jle 0xb9e                                
  0b95  3bde             cmp bx, si                               
  0b97  7d05             jge 0xb9e                                
  0b99  b80500           mov ax, 5                                
  0b9c  eb1c             jmp 0xbba                                
  0b9e  3bd1             cmp dx, cx                               
  0ba0  7d09             jge 0xbab                                
  0ba2  3bde             cmp bx, si                               
  0ba4  7e05             jle 0xbab                                
  0ba6  b80100           mov ax, 1                                
  0ba9  eb0f             jmp 0xbba                                
  0bab  3bd1             cmp dx, cx                               
  0bad  7d09             jge 0xbb8                                
  0baf  3bde             cmp bx, si                               
  0bb1  7d05             jge 0xbb8                                
  0bb3  b80300           mov ax, 3                                
  0bb6  eb02             jmp 0xbba                                
  0bb8  33c0             xor ax, ax                               
  0bba  5e               pop si                                   
  0bbb  5d               pop bp                                   
  0bbc  cb               retf                                     
