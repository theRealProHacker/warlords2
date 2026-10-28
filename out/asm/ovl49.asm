; ovl49 stub 307f file_off 0x6c670 size 0x1852

ovl49_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  833e862a00       cmp word ptr [0x2a86], 0                 
  0008  7505             jne 0xf                                  
  000a  90               nop                                      
  000b  0e               push cs                                  
  000c  e86300           call 0x72                                
  000f  681430           push 0x3014                              
  0012  685700           push 0x57                                
  0015  687f30           push 0x307f                              
  0018  687a00           push 0x7a                                
  001b  66682c000400     push 0x4002c                             
  0021  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0026  83c404           add sp, 4                                
  0029  52               push dx                                  
  002a  50               push ax                                  
  002b  66682c000300     push 0x3002c                             
  0031  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0036  83c404           add sp, 4                                
  0039  52               push dx                                  
  003a  50               push ax                                  
  003b  66682c000200     push 0x2002c                             
  0041  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0046  83c404           add sp, 4                                
  0049  52               push dx                                  
  004a  50               push ax                                  
  004b  66682c000100     push 0x1002c                             
  0051  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0056  83c404           add sp, 4                                
  0059  52               push dx                                  
  005a  50               push ax                                  
  005b  666a2c           push 0x2c                                
  005e  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0063  83c404           add sp, 4                                
  0066  52               push dx                                  
  0067  50               push ax                                  
  0068  9a2500a530       lcall 0x30a5, 0x25                       -> ovl56:0088
  006d  83c41c           add sp, 0x1c                             
  0070  5d               pop bp                                   
  0071  cb               retf                                     

ovl49_0072:  ; ENTRY
  0072  55               push bp                                  
  0073  8bec             mov bp, sp                               
  0075  6a04             push 4                                   
  0077  9a6100ba30       lcall 0x30ba, 0x61                       -> ovl58:026f
  007c  59               pop cx                                   
  007d  9ab5024c0a       lcall 0xa4c, 0x2b5                       -> 0a4c:02b5
  0082  5d               pop bp                                   
  0083  cb               retf                                     

ovl49_0084:  ; ENTRY
  0084  55               push bp                                  
  0085  8bec             mov bp, sp                               
  0087  81ecfc00         sub sp, 0xfc                             
  008b  9a8900c130       lcall 0x30c1, 0x89                       -> ovl59:0a1b
  0090  16               push ss                                  
  0091  8d46f4           lea ax, [bp - 0xc]                       
  0094  50               push ax                                  
  0095  16               push ss                                  
  0096  8d46f8           lea ax, [bp - 8]                         
  0099  50               push ax                                  
  009a  16               push ss                                  
  009b  8d46fc           lea ax, [bp - 4]                         
  009e  50               push ax                                  
  009f  9a0508280d       lcall 0xd28, 0x805                       -> 0d28:0805
  00a4  83c40c           add sp, 0xc                              
  00a7  668b46fc         mov eax, dword ptr [bp - 4]              
  00ab  66bbe8030000     mov ebx, 0x3e8                           
  00b1  6633d2           xor edx, edx                             
  00b4  66f7f3           div ebx                                  
  00b7  6650             push eax                                 
  00b9  66688b000400     push 0x4008b                             
  00bf  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  00c4  83c404           add sp, 4                                
  00c7  52               push dx                                  
  00c8  50               push ax                                  
  00c9  16               push ss                                  
  00ca  8d46a4           lea ax, [bp - 0x5c]                      
  00cd  50               push ax                                  
  00ce  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  00d3  83c40c           add sp, 0xc                              
  00d6  668b46f8         mov eax, dword ptr [bp - 8]              
  00da  66bbe8030000     mov ebx, 0x3e8                           
  00e0  6633d2           xor edx, edx                             
  00e3  66f7f3           div ebx                                  
  00e6  6650             push eax                                 
  00e8  66688b000500     push 0x5008b                             
  00ee  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  00f3  83c404           add sp, 4                                
  00f6  52               push dx                                  
  00f7  50               push ax                                  
  00f8  16               push ss                                  
  00f9  8d8654ff         lea ax, [bp - 0xac]                      
  00fd  50               push ax                                  
  00fe  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0103  83c40c           add sp, 0xc                              
  0106  668b46f4         mov eax, dword ptr [bp - 0xc]            
  010a  66bbe8030000     mov ebx, 0x3e8                           
  0110  6633d2           xor edx, edx                             
  0113  66f7f3           div ebx                                  
  0116  6650             push eax                                 
  0118  66688b000600     push 0x6008b                             
  011e  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0123  83c404           add sp, 4                                
  0126  52               push dx                                  
  0127  50               push ax                                  
  0128  16               push ss                                  
  0129  8d8604ff         lea ax, [bp - 0xfc]                      
  012d  50               push ax                                  
  012e  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0133  83c40c           add sp, 0xc                              
  0136  6a17             push 0x17                                
  0138  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  013d  59               pop cx                                   
  013e  16               push ss                                  
  013f  8d8604ff         lea ax, [bp - 0xfc]                      
  0143  50               push ax                                  
  0144  16               push ss                                  
  0145  8d8654ff         lea ax, [bp - 0xac]                      
  0149  50               push ax                                  
  014a  16               push ss                                  
  014b  8d46a4           lea ax, [bp - 0x5c]                      
  014e  50               push ax                                  
  014f  66688b000300     push 0x3008b                             
  0155  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  015a  83c404           add sp, 4                                
  015d  52               push dx                                  
  015e  50               push ax                                  
  015f  1e               push ds                                  
  0160  689212           push 0x1292                               ; "Version 1.02"
  0163  66688b000100     push 0x1008b                             
  0169  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  016e  83c404           add sp, 4                                
  0171  52               push dx                                  
  0172  50               push ax                                  
  0173  66688b000000     push 0x8b                                
  0179  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  017e  83c404           add sp, 4                                
  0181  52               push dx                                  
  0182  50               push ax                                  
  0183  9abb00d730       lcall 0x30d7, 0xbb                       -> ovl61:1471
  0188  83c41c           add sp, 0x1c                             
  018b  666a00           push 0                                   
  018e  9a8900d730       lcall 0x30d7, 0x89                       -> ovl61:10fb
  0193  83c404           add sp, 4                                
  0196  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  019b  c9               leave                                    
  019c  cb               retf                                     

ovl49_019d:  ; ENTRY
  019d  55               push bp                                  
  019e  8bec             mov bp, sp                               
  01a0  681430           push 0x3014                              
  01a3  685700           push 0x57                                
  01a6  687f30           push 0x307f                              
  01a9  687f00           push 0x7f                                
  01ac  66682d000400     push 0x4002d                             
  01b2  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  01b7  83c404           add sp, 4                                
  01ba  52               push dx                                  
  01bb  50               push ax                                  
  01bc  66682d000300     push 0x3002d                             
  01c2  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  01c7  83c404           add sp, 4                                
  01ca  52               push dx                                  
  01cb  50               push ax                                  
  01cc  66682d000200     push 0x2002d                             
  01d2  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  01d7  83c404           add sp, 4                                
  01da  52               push dx                                  
  01db  50               push ax                                  
  01dc  66682d000100     push 0x1002d                             
  01e2  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  01e7  83c404           add sp, 4                                
  01ea  52               push dx                                  
  01eb  50               push ax                                  
  01ec  666a2d           push 0x2d                                
  01ef  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  01f4  83c404           add sp, 4                                
  01f7  52               push dx                                  
  01f8  50               push ax                                  
  01f9  9a2500a530       lcall 0x30a5, 0x25                       -> ovl56:0088
  01fe  83c41c           add sp, 0x1c                             
  0201  5d               pop bp                                   
  0202  cb               retf                                     

ovl49_0203:  ; ENTRY
  0203  55               push bp                                  
  0204  8bec             mov bp, sp                               
  0206  56               push si                                  
  0207  9a6b006430       lcall 0x3064, 0x6b                       -> ovl45:1de4
  020c  33f6             xor si, si                               
  020e  eb1b             jmp 0x22b                                
  0210  8bc6             mov ax, si                               
  0212  6bc016           imul ax, ax, 0x16                        
  0215  ba0000           mov dx, 0                                
  0218  03d0             add dx, ax                               
  021a  81c28088         add dx, 0x8880                           
  021e  681d1e           push 0x1e1d                              
  0221  52               push dx                                  
  0222  9abe03620b       lcall 0xb62, 0x3be                       -> 0b62:03be
  0227  83c404           add sp, 4                                
  022a  46               inc si                                   
  022b  81fee803         cmp si, 0x3e8                            
  022f  7cdf             jl 0x210                                 
  0231  9a2500e830       lcall 0x30e8, 0x25                       -> ovl62:0000
  0236  9a2000f930       lcall 0x30f9, 0x20                       -> ovl64:1927
  023b  9a2500f930       lcall 0x30f9, 0x25                       -> ovl64:1931
  0240  9a34000831       lcall 0x3108, 0x34                       -> ovl65:01ff
  0245  9a8900f930       lcall 0x30f9, 0x89                       -> ovl64:113b
  024a  c706862a0000     mov word ptr [0x2a86], 0                 
  0250  c7066a160000     mov word ptr [0x166a], 0                 
  0256  9a8400e830       lcall 0x30e8, 0x84                       -> ovl62:0af3
  025b  6a01             push 1                                   
  025d  9a2000cc30       lcall 0x30cc, 0x20                       -> ovl60:0000
  0262  59               pop cx                                   
  0263  9a4d00db2f       lcall 0x2fdb, 0x4d                       -> ovl25:0519
  0268  5e               pop si                                   
  0269  5d               pop bp                                   
  026a  cb               retf                                     

ovl49_026b:  ; ENTRY
  026b  55               push bp                                  
  026c  8bec             mov bp, sp                               
  026e  56               push si                                  
  026f  c7062e480000     mov word ptr [0x482e], 0                 
  0275  33f6             xor si, si                               
  0277  eb33             jmp 0x2ac                                
  0279  80bc124700       cmp byte ptr [si + 0x4712], 0            
  027e  742b             je 0x2ab                                 
  0280  8b1e2e48         mov bx, word ptr [0x482e]                
  0284  d1e3             shl bx, 1                                
  0286  89b7fc4b         mov word ptr [bx + 0x4bfc], si           
  028a  1e               push ds                                  
  028b  8bc6             mov ax, si                               
  028d  6bc00f           imul ax, ax, 0xf                         
  0290  051c47           add ax, 0x471c                           
  0293  50               push ax                                  
  0294  a12e48           mov ax, word ptr [0x482e]                
  0297  c1e005           shl ax, 5                                
  029a  053c48           add ax, 0x483c                           
  029d  1e               push ds                                  
  029e  50               push ax                                  
  029f  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  02a4  83c408           add sp, 8                                
  02a7  ff062e48         inc word ptr [0x482e]                    
  02ab  46               inc si                                   
  02ac  83fe0a           cmp si, 0xa                              
  02af  7cc8             jl 0x279                                 
  02b1  ff368e12         push word ptr [0x128e]                   
  02b5  666a2f           push 0x2f                                
  02b8  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  02bd  83c404           add sp, 4                                
  02c0  52               push dx                                  
  02c1  50               push ax                                  
  02c2  687f30           push 0x307f                              
  02c5  689300           push 0x93                                
  02c8  9a20009030       lcall 0x3090, 0x20                       -> ovl51:0000
  02cd  83c40a           add sp, 0xa                              
  02d0  5e               pop si                                   
  02d1  5d               pop bp                                   
  02d2  cb               retf                                     

ovl49_02d3:  ; ENTRY
  02d3  55               push bp                                  
  02d4  8bec             mov bp, sp                               
  02d6  83ec52           sub sp, 0x52                             
  02d9  8b5606           mov dx, word ptr [bp + 6]                
  02dc  83faff           cmp dx, -1                               
  02df  753a             jne 0x31b                                
  02e1  833ec62800       cmp word ptr [0x28c6], 0                 
  02e6  740a             je 0x2f2                                 
  02e8  6a00             push 0                                   
  02ea  9a2000cc30       lcall 0x30cc, 0x20                       -> ovl60:0000
  02ef  e91f01           jmp 0x411                                
  02f2  833e862a00       cmp word ptr [0x2a86], 0                 
  02f7  740e             je 0x307                                 
  02f9  666a00           push 0                                   
  02fc  9a2000d730       lcall 0x30d7, 0x20                       -> ovl61:0000
  0301  83c404           add sp, 4                                
  0304  e90b01           jmp 0x412                                
  0307  666800000100     push 0x10000                             
  030d  666a00           push 0                                   
  0310  9a2f00ab30       lcall 0x30ab, 0x2f                       -> ovl57:0000
  0315  83c408           add sp, 8                                
  0318  e9f700           jmp 0x412                                
  031b  8bc2             mov ax, dx                               
  031d  a38e12           mov word ptr [0x128e], ax                
  0320  a38c12           mov word ptr [0x128c], ax                
  0323  666a01           push 1                                   
  0326  52               push dx                                  
  0327  90               nop                                      
  0328  0e               push cs                                  
  0329  e8e800           call 0x414                               
  032c  83c406           add sp, 6                                
  032f  8946fe           mov word ptr [bp - 2], ax                
  0332  9a20007c30       lcall 0x307c, 0x20                       -> ovl48:0000
  0337  833e862a00       cmp word ptr [0x2a86], 0                 
  033c  7410             je 0x34e                                 
  033e  837efe00         cmp word ptr [bp - 2], 0                 
  0342  740a             je 0x34e                                 
  0344  9a7500d730       lcall 0x30d7, 0x75                       -> ovl61:0a6e
  0349  9a2f000831       lcall 0x3108, 0x2f                       -> ovl65:0698
  034e  833ec62800       cmp word ptr [0x28c6], 0                 
  0353  7507             jne 0x35c                                
  0355  833e862a00       cmp word ptr [0x2a86], 0                 
  035a  7505             jne 0x361                                
  035c  9a20000831       lcall 0x3108, 0x20                       -> ovl65:0000
  0361  9a2a00e830       lcall 0x30e8, 0x2a                       -> ovl62:03f9
  0366  9a2f00e830       lcall 0x30e8, 0x2f                       -> ovl62:02bf
  036b  9a3400e830       lcall 0x30e8, 0x34                       -> ovl62:0372
  0370  b8042c           mov ax, 0x2c04                           
  0373  8ec0             mov es, ax                               
  0375  26ff361001       push word ptr es:[0x110]                 
  037a  9a39001d30       lcall 0x301d, 0x39                       -> ovl35:09f2
  037f  59               pop cx                                   
  0380  9a2500e830       lcall 0x30e8, 0x25                       -> ovl62:0000
  0385  6a01             push 1                                   
  0387  b8042c           mov ax, 0x2c04                           
  038a  8ec0             mov es, ax                               
  038c  26ff361001       push word ptr es:[0x110]                 
  0391  9a9e0d5505       lcall 0x555, 0xd9e                       -> 0555:0d9e
  0396  83c404           add sp, 4                                
  0399  6a00             push 0                                   
  039b  ff36c628         push word ptr [0x28c6]                   
  039f  9a2000d730       lcall 0x30d7, 0x20                       -> ovl61:0000
  03a4  83c404           add sp, 4                                
  03a7  c706c6280000     mov word ptr [0x28c6], 0                 
  03ad  666a01           push 1                                   
  03b0  9a34002031       lcall 0x3120, 0x34                       -> ovl68:0952
  03b5  83c404           add sp, 4                                
  03b8  666a00           push 0                                   
  03bb  9a34002031       lcall 0x3120, 0x34                       -> ovl68:0952
  03c0  83c404           add sp, 4                                
  03c3  b8042c           mov ax, 0x2c04                           
  03c6  8ec0             mov es, ax                               
  03c8  26a11001         mov ax, word ptr es:[0x110]              
  03cc  6bc014           imul ax, ax, 0x14                        
  03cf  050000           add ax, 0                                
  03d2  68042c           push 0x2c04                              
  03d5  50               push ax                                  
  03d6  66682f000100     push 0x1002f                             
  03dc  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  03e1  83c404           add sp, 4                                
  03e4  52               push dx                                  
  03e5  50               push ax                                  
  03e6  16               push ss                                  
  03e7  8d46ae           lea ax, [bp - 0x52]                      
  03ea  50               push ax                                  
  03eb  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  03f0  83c40c           add sp, 0xc                              
  03f3  16               push ss                                  
  03f4  8d46ae           lea ax, [bp - 0x52]                      
  03f7  50               push ax                                  
  03f8  9a8900d730       lcall 0x30d7, 0x89                       -> ovl61:10fb
  03fd  83c404           add sp, 4                                
  0400  9a3900f930       lcall 0x30f9, 0x39                       -> ovl64:006c
  0405  9a8400e830       lcall 0x30e8, 0x84                       -> ovl62:0af3
  040a  6a01             push 1                                   
  040c  9a2000ba30       lcall 0x30ba, 0x20                       -> ovl58:0000
  0411  59               pop cx                                   
  0412  c9               leave                                    
  0413  cb               retf                                     

ovl49_0414:  ; ENTRY
  0414  55               push bp                                  
  0415  8bec             mov bp, sp                               
  0417  83ec2c           sub sp, 0x2c                             
  041a  56               push si                                  
  041b  57               push di                                  
  041c  8b7e06           mov di, word ptr [bp + 6]                
  041f  c746e80000       mov word ptr [bp - 0x18], 0              
  0424  833ec62800       cmp word ptr [0x28c6], 0                 
  0429  7507             jne 0x432                                
  042b  833e862a00       cmp word ptr [0x2a86], 0                 
  0430  7506             jne 0x438                                
  0432  1e               push ds                                  
  0433  689f12           push 0x129f                              
  0436  eb04             jmp 0x43c                                
  0438  1e               push ds                                  
  0439  68a85d           push 0x5da8                              
  043c  16               push ss                                  
  043d  8d46ea           lea ax, [bp - 0x16]                      
  0440  50               push ax                                  
  0441  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0446  83c408           add sp, 8                                
  0449  9a66009709       lcall 0x997, 0x66                        -> 0997:0066
  044e  9a2000f930       lcall 0x30f9, 0x20                       -> ovl64:1927
  0453  9a2500f930       lcall 0x30f9, 0x25                       -> ovl64:1931
  0458  66c746fc00000000 mov dword ptr [bp - 4], 0                
  0460  eb3e             jmp 0x4a0                                
  0462  8b5efc           mov bx, word ptr [bp - 4]                
  0465  6bdb16           imul bx, bx, 0x16                        
  0468  b81d1e           mov ax, 0x1e1d                           
  046b  8ec0             mov es, ax                               
  046d  26c68785880f     mov byte ptr es:[bx - 0x777b], 0xf       
  0473  8b5efc           mov bx, word ptr [bp - 4]                
  0476  6bdb16           imul bx, bx, 0x16                        
  0479  ba0000           mov dx, 0                                
  047c  81c28088         add dx, 0x8880                           
  0480  03da             add bx, dx                               
  0482  8b76fc           mov si, word ptr [bp - 4]                
  0485  6bf616           imul si, si, 0x16                        
  0488  ba1d1e           mov dx, 0x1e1d                           
  048b  b9ffff           mov cx, 0xffff                           
  048e  8ec2             mov es, dx                               
  0490  26898c8288       mov word ptr es:[si - 0x777e], cx        
  0495  8bd1             mov dx, cx                               
  0497  8ec0             mov es, ax                               
  0499  268917           mov word ptr es:[bx], dx                 
  049c  66ff46fc         inc dword ptr [bp - 4]                   
  04a0  66837efc0a       cmp dword ptr [bp - 4], 0xa              
  04a5  7cbb             jl 0x462                                 
  04a7  6633c0           xor eax, eax                             
  04aa  66a35e5e         mov dword ptr [0x5e5e], eax              
  04ae  66a3625e         mov dword ptr [0x5e62], eax              
  04b2  66c746fc00000000 mov dword ptr [bp - 4], 0                
  04ba  eb16             jmp 0x4d2                                
  04bc  8b5efc           mov bx, word ptr [bp - 4]                
  04bf  c1e302           shl bx, 2                                
  04c2  c787405e0000     mov word ptr [bx + 0x5e40], 0            
  04c8  c7873e5e0000     mov word ptr [bx + 0x5e3e], 0            
  04ce  66ff46fc         inc dword ptr [bp - 4]                   
  04d2  66837efc08       cmp dword ptr [bp - 4], 8                
  04d7  7ce3             jl 0x4bc                                 
  04d9  6a17             push 0x17                                
  04db  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  04e0  59               pop cx                                   
  04e1  837e0800         cmp word ptr [bp + 8], 0                 
  04e5  7468             je 0x54f                                 
  04e7  666885000600     push 0x60085                             
  04ed  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  04f2  83c404           add sp, 4                                
  04f5  52               push dx                                  
  04f6  50               push ax                                  
  04f7  666885000500     push 0x50085                             
  04fd  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0502  83c404           add sp, 4                                
  0505  52               push dx                                  
  0506  50               push ax                                  
  0507  666885000400     push 0x40085                             
  050d  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0512  83c404           add sp, 4                                
  0515  52               push dx                                  
  0516  50               push ax                                  
  0517  666885000300     push 0x30085                             
  051d  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0522  83c404           add sp, 4                                
  0525  52               push dx                                  
  0526  50               push ax                                  
  0527  666885000200     push 0x20085                             
  052d  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0532  83c404           add sp, 4                                
  0535  52               push dx                                  
  0536  50               push ax                                  
  0537  666885000100     push 0x10085                             
  053d  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0542  83c404           add sp, 4                                
  0545  52               push dx                                  
  0546  50               push ax                                  
  0547  666885000000     push 0x85                                
  054d  eb66             jmp 0x5b5                                
  054f  666886000600     push 0x60086                             
  0555  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  055a  83c404           add sp, 4                                
  055d  52               push dx                                  
  055e  50               push ax                                  
  055f  666886000500     push 0x50086                             
  0565  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  056a  83c404           add sp, 4                                
  056d  52               push dx                                  
  056e  50               push ax                                  
  056f  666886000400     push 0x40086                             
  0575  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  057a  83c404           add sp, 4                                
  057d  52               push dx                                  
  057e  50               push ax                                  
  057f  666886000300     push 0x30086                             
  0585  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  058a  83c404           add sp, 4                                
  058d  52               push dx                                  
  058e  50               push ax                                  
  058f  666886000200     push 0x20086                             
  0595  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  059a  83c404           add sp, 4                                
  059d  52               push dx                                  
  059e  50               push ax                                  
  059f  666886000100     push 0x10086                             
  05a5  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  05aa  83c404           add sp, 4                                
  05ad  52               push dx                                  
  05ae  50               push ax                                  
  05af  666886000000     push 0x86                                
  05b5  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  05ba  83c404           add sp, 4                                
  05bd  52               push dx                                  
  05be  50               push ax                                  
  05bf  9abb00d730       lcall 0x30d7, 0xbb                       -> ovl61:1471
  05c4  83c41c           add sp, 0x1c                             
  05c7  9a4300622f       lcall 0x2f62, 0x43                       -> ovl02:01b5
  05cc  6a00             push 0                                   
  05ce  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  05d3  59               pop cx                                   
  05d4  9a8900f930       lcall 0x30f9, 0x89                       -> ovl64:113b
  05d9  6a0a             push 0xa                                 
  05db  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  05e0  59               pop cx                                   
  05e1  837e0800         cmp word ptr [bp + 8], 0                 
  05e5  7405             je 0x5ec                                 
  05e7  57               push di                                  
  05e8  6a1c             push 0x1c                                
  05ea  eb03             jmp 0x5ef                                
  05ec  57               push di                                  
  05ed  6a1a             push 0x1a                                
  05ef  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  05f4  83c404           add sp, 4                                
  05f7  52               push dx                                  
  05f8  50               push ax                                  
  05f9  16               push ss                                  
  05fa  8d46d4           lea ax, [bp - 0x2c]                      
  05fd  50               push ax                                  
  05fe  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0603  83c408           add sp, 8                                
  0606  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  060b  6a02             push 2                                   
  060d  16               push ss                                  
  060e  8d46d4           lea ax, [bp - 0x2c]                      
  0611  50               push ax                                  
  0612  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0617  83c406           add sp, 6                                
  061a  8bf0             mov si, ax                               
  061c  0bf6             or si, si                                
  061e  7d03             jge 0x623                                
  0620  e98e02           jmp 0x8b1                                
  0623  6a54             push 0x54                                
  0625  1e               push ds                                  
  0626  68645d           push 0x5d64                              
  0629  50               push ax                                  
  062a  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  062f  83c408           add sp, 8                                
  0632  68e12e           push 0x2ee1                              
  0635  68042c           push 0x2c04                              
  0638  680000           push 0                                   
  063b  56               push si                                  
  063c  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0641  83c408           add sp, 8                                
  0644  6a14             push 0x14                                
  0646  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  064b  59               pop cx                                   
  064c  6870de           push 0xde70                              
  064f  681d1e           push 0x1e1d                              
  0652  680000           push 0                                   
  0655  56               push si                                  
  0656  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  065b  83c408           add sp, 8                                
  065e  684044           push 0x4440                              
  0661  68d919           push 0x19d9                              
  0664  680000           push 0                                   
  0667  56               push si                                  
  0668  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  066d  83c408           add sp, 8                                
  0670  6a1e             push 0x1e                                
  0672  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  0677  59               pop cx                                   
  0678  66ff367012       push dword ptr [0x1270]                  
  067d  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0682  83c404           add sp, 4                                
  0685  89166e12         mov word ptr [0x126e], dx                
  0689  a36c12           mov word ptr [0x126c], ax                
  068c  684044           push 0x4440                              
  068f  52               push dx                                  
  0690  50               push ax                                  
  0691  56               push si                                  
  0692  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0697  83c408           add sp, 8                                
  069a  66ff367012       push dword ptr [0x1270]                  
  069f  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  06a4  83c404           add sp, 4                                
  06a7  6a28             push 0x28                                
  06a9  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  06ae  59               pop cx                                   
  06af  6a04             push 4                                   
  06b1  16               push ss                                  
  06b2  8d46f8           lea ax, [bp - 8]                         
  06b5  50               push ax                                  
  06b6  56               push si                                  
  06b7  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  06bc  83c408           add sp, 8                                
  06bf  ff76f8           push word ptr [bp - 8]                   
  06c2  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  06c7  59               pop cx                                   
  06c8  8956f6           mov word ptr [bp - 0xa], dx              
  06cb  8946f4           mov word ptr [bp - 0xc], ax              
  06ce  ff76f8           push word ptr [bp - 8]                   
  06d1  52               push dx                                  
  06d2  50               push ax                                  
  06d3  56               push si                                  
  06d4  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  06d9  83c408           add sp, 8                                
  06dc  666800000900     push 0x90000                             
  06e2  6a1d             push 0x1d                                
  06e4  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  06e9  83c404           add sp, 4                                
  06ec  52               push dx                                  
  06ed  50               push ax                                  
  06ee  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  06f3  83c406           add sp, 6                                
  06f6  8bf8             mov di, ax                               
  06f8  ff76f8           push word ptr [bp - 8]                   
  06fb  66ff76f4         push dword ptr [bp - 0xc]                
  06ff  50               push ax                                  
  0700  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0705  83c408           add sp, 8                                
  0708  57               push di                                  
  0709  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  070e  59               pop cx                                   
  070f  66ff76f4         push dword ptr [bp - 0xc]                
  0713  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  0718  83c404           add sp, 4                                
  071b  6a32             push 0x32                                
  071d  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  0722  59               pop cx                                   
  0723  b8042c           mov ax, 0x2c04                           
  0726  8ec0             mov es, ax                               
  0728  26833e200100     cmp word ptr es:[0x120], 0               
  072e  746c             je 0x79c                                 
  0730  6a04             push 4                                   
  0732  16               push ss                                  
  0733  8d46f8           lea ax, [bp - 8]                         
  0736  50               push ax                                  
  0737  56               push si                                  
  0738  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  073d  83c408           add sp, 8                                
  0740  ff76f8           push word ptr [bp - 8]                   
  0743  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  0748  59               pop cx                                   
  0749  8956f6           mov word ptr [bp - 0xa], dx              
  074c  8946f4           mov word ptr [bp - 0xc], ax              
  074f  ff76f8           push word ptr [bp - 8]                   
  0752  52               push dx                                  
  0753  50               push ax                                  
  0754  56               push si                                  
  0755  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  075a  83c408           add sp, 8                                
  075d  666800000900     push 0x90000                             
  0763  6a22             push 0x22                                
  0765  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  076a  83c404           add sp, 4                                
  076d  52               push dx                                  
  076e  50               push ax                                  
  076f  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0774  83c406           add sp, 6                                
  0777  8bf8             mov di, ax                               
  0779  ff76f8           push word ptr [bp - 8]                   
  077c  66ff76f4         push dword ptr [bp - 0xc]                
  0780  50               push ax                                  
  0781  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0786  83c408           add sp, 8                                
  0789  57               push di                                  
  078a  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  078f  59               pop cx                                   
  0790  66ff76f4         push dword ptr [bp - 0xc]                
  0794  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  0799  83c404           add sp, 4                                
  079c  6a3c             push 0x3c                                
  079e  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  07a3  59               pop cx                                   
  07a4  b8042c           mov ax, 0x2c04                           
  07a7  8ec0             mov es, ax                               
  07a9  26833e200100     cmp word ptr es:[0x120], 0               
  07af  746c             je 0x81d                                 
  07b1  6a04             push 4                                   
  07b3  16               push ss                                  
  07b4  8d46f8           lea ax, [bp - 8]                         
  07b7  50               push ax                                  
  07b8  56               push si                                  
  07b9  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  07be  83c408           add sp, 8                                
  07c1  ff76f8           push word ptr [bp - 8]                   
  07c4  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  07c9  59               pop cx                                   
  07ca  8956f6           mov word ptr [bp - 0xa], dx              
  07cd  8946f4           mov word ptr [bp - 0xc], ax              
  07d0  ff76f8           push word ptr [bp - 8]                   
  07d3  52               push dx                                  
  07d4  50               push ax                                  
  07d5  56               push si                                  
  07d6  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  07db  83c408           add sp, 8                                
  07de  666800000900     push 0x90000                             
  07e4  6a23             push 0x23                                
  07e6  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  07eb  83c404           add sp, 4                                
  07ee  52               push dx                                  
  07ef  50               push ax                                  
  07f0  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  07f5  83c406           add sp, 6                                
  07f8  8bf8             mov di, ax                               
  07fa  ff76f8           push word ptr [bp - 8]                   
  07fd  66ff76f4         push dword ptr [bp - 0xc]                
  0801  50               push ax                                  
  0802  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0807  83c408           add sp, 8                                
  080a  57               push di                                  
  080b  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0810  59               pop cx                                   
  0811  66ff76f4         push dword ptr [bp - 0xc]                
  0815  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  081a  83c404           add sp, 4                                
  081d  6a46             push 0x46                                
  081f  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  0824  59               pop cx                                   
  0825  6a04             push 4                                   
  0827  16               push ss                                  
  0828  8d46f8           lea ax, [bp - 8]                         
  082b  50               push ax                                  
  082c  56               push si                                  
  082d  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0832  83c408           add sp, 8                                
  0835  ff76f8           push word ptr [bp - 8]                   
  0838  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  083d  59               pop cx                                   
  083e  8956f6           mov word ptr [bp - 0xa], dx              
  0841  8946f4           mov word ptr [bp - 0xc], ax              
  0844  ff76f8           push word ptr [bp - 8]                   
  0847  52               push dx                                  
  0848  50               push ax                                  
  0849  56               push si                                  
  084a  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  084f  83c408           add sp, 8                                
  0852  666800000900     push 0x90000                             
  0858  6a06             push 6                                   
  085a  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  085f  83c404           add sp, 4                                
  0862  52               push dx                                  
  0863  50               push ax                                  
  0864  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0869  83c406           add sp, 6                                
  086c  8bf8             mov di, ax                               
  086e  ff76f8           push word ptr [bp - 8]                   
  0871  66ff76f4         push dword ptr [bp - 0xc]                
  0875  50               push ax                                  
  0876  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  087b  83c408           add sp, 8                                
  087e  57               push di                                  
  087f  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0884  59               pop cx                                   
  0885  66ff76f4         push dword ptr [bp - 0xc]                
  0889  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  088e  83c404           add sp, 4                                
  0891  b8042c           mov ax, 0x2c04                           
  0894  8ec0             mov es, ax                               
  0896  26c70630010100   mov word ptr es:[0x130], 1               
  089d  837e0800         cmp word ptr [bp + 8], 0                 
  08a1  7407             je 0x8aa                                 
  08a3  56               push si                                  
  08a4  9a3900f72f       lcall 0x2ff7, 0x39                       -> ovl29:0dff
  08a9  59               pop cx                                   
  08aa  56               push si                                  
  08ab  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  08b0  59               pop cx                                   
  08b1  6a50             push 0x50                                
  08b3  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  08b8  59               pop cx                                   
  08b9  b8042c           mov ax, 0x2c04                           
  08bc  8ec0             mov es, ax                               
  08be  26833e240100     cmp word ptr es:[0x124], 0               
  08c4  740d             je 0x8d3                                 
  08c6  8ec0             mov es, ax                               
  08c8  26ff361001       push word ptr es:[0x110]                 
  08cd  9a5200f230       lcall 0x30f2, 0x52                       -> ovl63:2200
  08d2  59               pop cx                                   
  08d3  6a07             push 7                                   
  08d5  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  08da  59               pop cx                                   
  08db  6a5a             push 0x5a                                
  08dd  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  08e2  59               pop cx                                   
  08e3  837e0a00         cmp word ptr [bp + 0xa], 0               
  08e7  7515             jne 0x8fe                                
  08e9  16               push ss                                  
  08ea  8d46ea           lea ax, [bp - 0x16]                      
  08ed  50               push ax                                  
  08ee  1e               push ds                                  
  08ef  68a85d           push 0x5da8                              
  08f2  9a404a0000       lcall 0, 0x4a40                          -> 0000:4a40
  08f7  83c408           add sp, 8                                
  08fa  0bc0             or ax, ax                                
  08fc  740a             je 0x908                                 
  08fe  9a5700f230       lcall 0x30f2, 0x57                       -> ovl63:232b
  0903  c746e80100       mov word ptr [bp - 0x18], 1              
  0908  b8042c           mov ax, 0x2c04                           
  090b  8ec0             mov es, ax                               
  090d  26833e200100     cmp word ptr es:[0x120], 0               
  0913  7405             je 0x91a                                 
  0915  9a6b006430       lcall 0x3064, 0x6b                       -> ovl45:1de4
  091a  6a64             push 0x64                                
  091c  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  0921  59               pop cx                                   
  0922  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  0927  6a01             push 1                                   
  0929  9a2000a230       lcall 0x30a2, 0x20                       -> ovl55:0000
  092e  59               pop cx                                   
  092f  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0934  8b46e8           mov ax, word ptr [bp - 0x18]             
  0937  5f               pop di                                   
  0938  5e               pop si                                   
  0939  c9               leave                                    
  093a  cb               retf                                     

ovl49_093b:  ; ENTRY
  093b  55               push bp                                  
  093c  8bec             mov bp, sp                               
  093e  56               push si                                  
  093f  c7062e480a00     mov word ptr [0x482e], 0xa               
  0945  33f6             xor si, si                               
  0947  eb25             jmp 0x96e                                
  0949  8bde             mov bx, si                               
  094b  d1e3             shl bx, 1                                
  094d  89b7fc4b         mov word ptr [bx + 0x4bfc], si           
  0951  1e               push ds                                  
  0952  8bc6             mov ax, si                               
  0954  6bc00f           imul ax, ax, 0xf                         
  0957  051c47           add ax, 0x471c                           
  095a  50               push ax                                  
  095b  8bc6             mov ax, si                               
  095d  c1e005           shl ax, 5                                
  0960  053c48           add ax, 0x483c                           
  0963  1e               push ds                                  
  0964  50               push ax                                  
  0965  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  096a  83c408           add sp, 8                                
  096d  46               inc si                                   
  096e  83fe0a           cmp si, 0xa                              
  0971  7cd6             jl 0x949                                 
  0973  ff368e12         push word ptr [0x128e]                   
  0977  666a2e           push 0x2e                                
  097a  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  097f  83c404           add sp, 4                                
  0982  52               push dx                                  
  0983  50               push ax                                  
  0984  687f30           push 0x307f                              
  0987  688e00           push 0x8e                                
  098a  9a20009030       lcall 0x3090, 0x20                       -> ovl51:0000
  098f  83c40a           add sp, 0xa                              
  0992  5e               pop si                                   
  0993  5d               pop bp                                   
  0994  cb               retf                                     

ovl49_0995:  ; ENTRY
  0995  55               push bp                                  
  0996  8bec             mov bp, sp                               
  0998  8b5606           mov dx, word ptr [bp + 6]                
  099b  0bd2             or dx, dx                                
  099d  7d0d             jge 0x9ac                                
  099f  666a00           push 0                                   
  09a2  9a2000d730       lcall 0x30d7, 0x20                       -> ovl61:0000
  09a7  83c404           add sp, 4                                
  09aa  eb5b             jmp 0xa07                                
  09ac  8bc2             mov ax, dx                               
  09ae  a38c12           mov word ptr [0x128c], ax                
  09b1  a38e12           mov word ptr [0x128e], ax                
  09b4  66680f00a000     push 0xa0000f                            
  09ba  6a01             push 1                                   
  09bc  681430           push 0x3014                              
  09bf  685700           push 0x57                                
  09c2  687f30           push 0x307f                              
  09c5  688400           push 0x84                                
  09c8  8bc2             mov ax, dx                               
  09ca  6bc00f           imul ax, ax, 0xf                         
  09cd  051c47           add ax, 0x471c                           
  09d0  1e               push ds                                  
  09d1  50               push ax                                  
  09d2  66682e000200     push 0x2002e                             
  09d8  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  09dd  83c404           add sp, 4                                
  09e0  52               push dx                                  
  09e1  50               push ax                                  
  09e2  66682e000100     push 0x1002e                             
  09e8  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  09ed  83c404           add sp, 4                                
  09f0  52               push dx                                  
  09f1  50               push ax                                  
  09f2  666a2e           push 0x2e                                
  09f5  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  09fa  83c404           add sp, 4                                
  09fd  52               push dx                                  
  09fe  50               push ax                                  
  09ff  9a2000a530       lcall 0x30a5, 0x20                       -> ovl56:0000
  0a04  83c41e           add sp, 0x1e                             
  0a07  5d               pop bp                                   
  0a08  cb               retf                                     

ovl49_0a09:  ; ENTRY
  0a09  55               push bp                                  
  0a0a  8bec             mov bp, sp                               
  0a0c  8b460a           mov ax, word ptr [bp + 0xa]              
  0a0f  a38c12           mov word ptr [0x128c], ax                
  0a12  666a00           push 0                                   
  0a15  6a00             push 0                                   
  0a17  66ff7606         push dword ptr [bp + 6]                  
  0a1b  90               nop                                      
  0a1c  0e               push cs                                  
  0a1d  e82600           call 0xa46                               
  0a20  83c40a           add sp, 0xa                              
  0a23  5d               pop bp                                   
  0a24  cb               retf                                     

ovl49_0a25:  ; ENTRY
  0a25  55               push bp                                  
  0a26  8bec             mov bp, sp                               
  0a28  666a00           push 0                                   
  0a2b  6a00             push 0                                   
  0a2d  66ff7606         push dword ptr [bp + 6]                  
  0a31  90               nop                                      
  0a32  0e               push cs                                  
  0a33  e81000           call 0xa46                               
  0a36  83c40a           add sp, 0xa                              
  0a39  666a00           push 0                                   
  0a3c  9a2000d730       lcall 0x30d7, 0x20                       -> ovl61:0000
  0a41  83c404           add sp, 4                                
  0a44  5d               pop bp                                   
  0a45  cb               retf                                     

ovl49_0a46:  ; ENTRY
  0a46  55               push bp                                  
  0a47  8bec             mov bp, sp                               
  0a49  83ec58           sub sp, 0x58                             
  0a4c  56               push si                                  
  0a4d  57               push di                                  
  0a4e  66837e0600       cmp dword ptr [bp + 6], 0                
  0a53  7425             je 0xa7a                                 
  0a55  66ff7606         push dword ptr [bp + 6]                  
  0a59  a18c12           mov ax, word ptr [0x128c]                
  0a5c  6bc00f           imul ax, ax, 0xf                         
  0a5f  051c47           add ax, 0x471c                           
  0a62  1e               push ds                                  
  0a63  50               push ax                                  
  0a64  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0a69  83c408           add sp, 8                                
  0a6c  8b1e8c12         mov bx, word ptr [0x128c]                
  0a70  c687124701       mov byte ptr [bx + 0x4712], 1            
  0a75  90               nop                                      
  0a76  0e               push cs                                  
  0a77  e8d204           call 0xf4c                               
  0a7a  837e0a00         cmp word ptr [bp + 0xa], 0               
  0a7e  7410             je 0xa90                                 
  0a80  66ff760c         push dword ptr [bp + 0xc]                
  0a84  16               push ss                                  
  0a85  8d46a8           lea ax, [bp - 0x58]                      
  0a88  50               push ax                                  
  0a89  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0a8e  eb1a             jmp 0xaaa                                
  0a90  ff368c12         push word ptr [0x128c]                   
  0a94  6a1c             push 0x1c                                
  0a96  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0a9b  83c404           add sp, 4                                
  0a9e  52               push dx                                  
  0a9f  50               push ax                                  
  0aa0  16               push ss                                  
  0aa1  8d46a8           lea ax, [bp - 0x58]                      
  0aa4  50               push ax                                  
  0aa5  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0aaa  83c408           add sp, 8                                
  0aad  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0ab2  6a09             push 9                                   
  0ab4  16               push ss                                  
  0ab5  8d46a8           lea ax, [bp - 0x58]                      
  0ab8  50               push ax                                  
  0ab9  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0abe  83c406           add sp, 6                                
  0ac1  8bf0             mov si, ax                               
  0ac3  0bf6             or si, si                                
  0ac5  7d03             jge 0xaca                                
  0ac7  e98e02           jmp 0xd58                                
  0aca  6a54             push 0x54                                
  0acc  1e               push ds                                  
  0acd  68645d           push 0x5d64                              
  0ad0  50               push ax                                  
  0ad1  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0ad6  83c408           add sp, 8                                
  0ad9  68e12e           push 0x2ee1                              
  0adc  68042c           push 0x2c04                              
  0adf  680000           push 0                                   
  0ae2  56               push si                                  
  0ae3  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0ae8  83c408           add sp, 8                                
  0aeb  6870de           push 0xde70                              
  0aee  681d1e           push 0x1e1d                              
  0af1  680000           push 0                                   
  0af4  56               push si                                  
  0af5  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0afa  83c408           add sp, 8                                
  0afd  684044           push 0x4440                              
  0b00  68d919           push 0x19d9                              
  0b03  680000           push 0                                   
  0b06  56               push si                                  
  0b07  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0b0c  83c408           add sp, 8                                
  0b0f  66ff367012       push dword ptr [0x1270]                  
  0b14  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0b19  83c404           add sp, 4                                
  0b1c  89166e12         mov word ptr [0x126e], dx                
  0b20  a36c12           mov word ptr [0x126c], ax                
  0b23  684044           push 0x4440                              
  0b26  52               push dx                                  
  0b27  50               push ax                                  
  0b28  56               push si                                  
  0b29  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0b2e  83c408           add sp, 8                                
  0b31  66ff367012       push dword ptr [0x1270]                  
  0b36  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0b3b  83c404           add sp, 4                                
  0b3e  666800000200     push 0x20000                             
  0b44  6a1d             push 0x1d                                
  0b46  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0b4b  83c404           add sp, 4                                
  0b4e  52               push dx                                  
  0b4f  50               push ax                                  
  0b50  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0b55  83c406           add sp, 6                                
  0b58  8bf8             mov di, ax                               
  0b5a  50               push ax                                  
  0b5b  9aa9000b07       lcall 0x70b, 0xa9                        -> 070b:00a9
  0b60  52               push dx                                  
  0b61  50               push ax                                  
  0b62  6658             pop eax                                  
  0b64  59               pop cx                                   
  0b65  668946fc         mov dword ptr [bp - 4], eax              
  0b69  ff76fc           push word ptr [bp - 4]                   
  0b6c  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  0b71  59               pop cx                                   
  0b72  8956fa           mov word ptr [bp - 6], dx                
  0b75  8946f8           mov word ptr [bp - 8], ax                
  0b78  ff76fc           push word ptr [bp - 4]                   
  0b7b  52               push dx                                  
  0b7c  50               push ax                                  
  0b7d  57               push di                                  
  0b7e  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0b83  83c408           add sp, 8                                
  0b86  6a04             push 4                                   
  0b88  16               push ss                                  
  0b89  8d46fc           lea ax, [bp - 4]                         
  0b8c  50               push ax                                  
  0b8d  56               push si                                  
  0b8e  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0b93  83c408           add sp, 8                                
  0b96  ff76fc           push word ptr [bp - 4]                   
  0b99  66ff76f8         push dword ptr [bp - 8]                  
  0b9d  56               push si                                  
  0b9e  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0ba3  83c408           add sp, 8                                
  0ba6  57               push di                                  
  0ba7  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0bac  59               pop cx                                   
  0bad  66ff76f8         push dword ptr [bp - 8]                  
  0bb1  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  0bb6  83c404           add sp, 4                                
  0bb9  b8042c           mov ax, 0x2c04                           
  0bbc  8ec0             mov es, ax                               
  0bbe  26833e200100     cmp word ptr es:[0x120], 0               
  0bc4  747b             je 0xc41                                 
  0bc6  666800000200     push 0x20000                             
  0bcc  6a22             push 0x22                                
  0bce  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0bd3  83c404           add sp, 4                                
  0bd6  52               push dx                                  
  0bd7  50               push ax                                  
  0bd8  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0bdd  83c406           add sp, 6                                
  0be0  8bf8             mov di, ax                               
  0be2  50               push ax                                  
  0be3  9aa9000b07       lcall 0x70b, 0xa9                        -> 070b:00a9
  0be8  52               push dx                                  
  0be9  50               push ax                                  
  0bea  6658             pop eax                                  
  0bec  59               pop cx                                   
  0bed  668946fc         mov dword ptr [bp - 4], eax              
  0bf1  ff76fc           push word ptr [bp - 4]                   
  0bf4  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  0bf9  59               pop cx                                   
  0bfa  8956fa           mov word ptr [bp - 6], dx                
  0bfd  8946f8           mov word ptr [bp - 8], ax                
  0c00  ff76fc           push word ptr [bp - 4]                   
  0c03  52               push dx                                  
  0c04  50               push ax                                  
  0c05  57               push di                                  
  0c06  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0c0b  83c408           add sp, 8                                
  0c0e  6a04             push 4                                   
  0c10  16               push ss                                  
  0c11  8d46fc           lea ax, [bp - 4]                         
  0c14  50               push ax                                  
  0c15  56               push si                                  
  0c16  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0c1b  83c408           add sp, 8                                
  0c1e  ff76fc           push word ptr [bp - 4]                   
  0c21  66ff76f8         push dword ptr [bp - 8]                  
  0c25  56               push si                                  
  0c26  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0c2b  83c408           add sp, 8                                
  0c2e  57               push di                                  
  0c2f  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0c34  59               pop cx                                   
  0c35  66ff76f8         push dword ptr [bp - 8]                  
  0c39  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  0c3e  83c404           add sp, 4                                
  0c41  b8042c           mov ax, 0x2c04                           
  0c44  8ec0             mov es, ax                               
  0c46  26833e200100     cmp word ptr es:[0x120], 0               
  0c4c  747b             je 0xcc9                                 
  0c4e  666800000200     push 0x20000                             
  0c54  6a23             push 0x23                                
  0c56  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0c5b  83c404           add sp, 4                                
  0c5e  52               push dx                                  
  0c5f  50               push ax                                  
  0c60  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0c65  83c406           add sp, 6                                
  0c68  8bf8             mov di, ax                               
  0c6a  50               push ax                                  
  0c6b  9aa9000b07       lcall 0x70b, 0xa9                        -> 070b:00a9
  0c70  52               push dx                                  
  0c71  50               push ax                                  
  0c72  6658             pop eax                                  
  0c74  59               pop cx                                   
  0c75  668946fc         mov dword ptr [bp - 4], eax              
  0c79  ff76fc           push word ptr [bp - 4]                   
  0c7c  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  0c81  59               pop cx                                   
  0c82  8956fa           mov word ptr [bp - 6], dx                
  0c85  8946f8           mov word ptr [bp - 8], ax                
  0c88  ff76fc           push word ptr [bp - 4]                   
  0c8b  52               push dx                                  
  0c8c  50               push ax                                  
  0c8d  57               push di                                  
  0c8e  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0c93  83c408           add sp, 8                                
  0c96  6a04             push 4                                   
  0c98  16               push ss                                  
  0c99  8d46fc           lea ax, [bp - 4]                         
  0c9c  50               push ax                                  
  0c9d  56               push si                                  
  0c9e  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0ca3  83c408           add sp, 8                                
  0ca6  ff76fc           push word ptr [bp - 4]                   
  0ca9  66ff76f8         push dword ptr [bp - 8]                  
  0cad  56               push si                                  
  0cae  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0cb3  83c408           add sp, 8                                
  0cb6  57               push di                                  
  0cb7  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0cbc  59               pop cx                                   
  0cbd  66ff76f8         push dword ptr [bp - 8]                  
  0cc1  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  0cc6  83c404           add sp, 4                                
  0cc9  666800000200     push 0x20000                             
  0ccf  6a06             push 6                                   
  0cd1  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0cd6  83c404           add sp, 4                                
  0cd9  52               push dx                                  
  0cda  50               push ax                                  
  0cdb  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0ce0  83c406           add sp, 6                                
  0ce3  8bf8             mov di, ax                               
  0ce5  50               push ax                                  
  0ce6  9aa9000b07       lcall 0x70b, 0xa9                        -> 070b:00a9
  0ceb  52               push dx                                  
  0cec  50               push ax                                  
  0ced  6658             pop eax                                  
  0cef  59               pop cx                                   
  0cf0  668946fc         mov dword ptr [bp - 4], eax              
  0cf4  ff76fc           push word ptr [bp - 4]                   
  0cf7  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  0cfc  59               pop cx                                   
  0cfd  8956fa           mov word ptr [bp - 6], dx                
  0d00  8946f8           mov word ptr [bp - 8], ax                
  0d03  ff76fc           push word ptr [bp - 4]                   
  0d06  52               push dx                                  
  0d07  50               push ax                                  
  0d08  57               push di                                  
  0d09  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0d0e  83c408           add sp, 8                                
  0d11  6a04             push 4                                   
  0d13  16               push ss                                  
  0d14  8d46fc           lea ax, [bp - 4]                         
  0d17  50               push ax                                  
  0d18  56               push si                                  
  0d19  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0d1e  83c408           add sp, 8                                
  0d21  ff76fc           push word ptr [bp - 4]                   
  0d24  66ff76f8         push dword ptr [bp - 8]                  
  0d28  56               push si                                  
  0d29  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0d2e  83c408           add sp, 8                                
  0d31  57               push di                                  
  0d32  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0d37  59               pop cx                                   
  0d38  66ff76f8         push dword ptr [bp - 8]                  
  0d3c  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  0d41  83c404           add sp, 4                                
  0d44  837e0a00         cmp word ptr [bp + 0xa], 0               
  0d48  7507             jne 0xd51                                
  0d4a  56               push si                                  
  0d4b  9a3400f72f       lcall 0x2ff7, 0x34                       -> ovl29:0da9
  0d50  59               pop cx                                   
  0d51  56               push si                                  
  0d52  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0d57  59               pop cx                                   
  0d58  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0d5d  5f               pop di                                   
  0d5e  5e               pop si                                   
  0d5f  c9               leave                                    
  0d60  cb               retf                                     

ovl49_0d61:  ; ENTRY
  0d61  55               push bp                                  
  0d62  8bec             mov bp, sp                               
  0d64  83ec0c           sub sp, 0xc                              
  0d67  56               push si                                  
  0d68  57               push di                                  
  0d69  6a02             push 2                                   
  0d6b  66ff7606         push dword ptr [bp + 6]                  
  0d6f  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0d74  83c406           add sp, 6                                
  0d77  8bf0             mov si, ax                               
  0d79  0bf6             or si, si                                
  0d7b  7d03             jge 0xd80                                
  0d7d  e9a100           jmp 0xe21                                
  0d80  6a09             push 9                                   
  0d82  66ff760a         push dword ptr [bp + 0xa]                
  0d86  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0d8b  83c406           add sp, 6                                
  0d8e  8bf8             mov di, ax                               
  0d90  0bff             or di, di                                
  0d92  7d0a             jge 0xd9e                                
  0d94  56               push si                                  
  0d95  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0d9a  59               pop cx                                   
  0d9b  e98300           jmp 0xe21                                
  0d9e  56               push si                                  
  0d9f  9aa9000b07       lcall 0x70b, 0xa9                        -> 070b:00a9
  0da4  52               push dx                                  
  0da5  50               push ax                                  
  0da6  6658             pop eax                                  
  0da8  59               pop cx                                   
  0da9  668946fc         mov dword ptr [bp - 4], eax              
  0dad  683075           push 0x7530                              
  0db0  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  0db5  59               pop cx                                   
  0db6  8956f6           mov word ptr [bp - 0xa], dx              
  0db9  8946f4           mov word ptr [bp - 0xc], ax              
  0dbc  eb42             jmp 0xe00                                
  0dbe  683075           push 0x7530                              
  0dc1  66ff76f4         push dword ptr [bp - 0xc]                
  0dc5  56               push si                                  
  0dc6  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0dcb  83c408           add sp, 8                                
  0dce  66817efc30750000 cmp dword ptr [bp - 4], 0x7530           
  0dd6  7d06             jge 0xdde                                
  0dd8  668b46fc         mov eax, dword ptr [bp - 4]              
  0ddc  eb06             jmp 0xde4                                
  0dde  66b830750000     mov eax, 0x7530                          
  0de4  668946f8         mov dword ptr [bp - 8], eax              
  0de8  ff76f8           push word ptr [bp - 8]                   
  0deb  66ff76f4         push dword ptr [bp - 0xc]                
  0def  57               push di                                  
  0df0  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0df5  83c408           add sp, 8                                
  0df8  668b46f8         mov eax, dword ptr [bp - 8]              
  0dfc  662946fc         sub dword ptr [bp - 4], eax              
  0e00  66837efc00       cmp dword ptr [bp - 4], 0                
  0e05  7fb7             jg 0xdbe                                 
  0e07  56               push si                                  
  0e08  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0e0d  59               pop cx                                   
  0e0e  57               push di                                  
  0e0f  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0e14  59               pop cx                                   
  0e15  66ff76f4         push dword ptr [bp - 0xc]                
  0e19  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  0e1e  83c404           add sp, 4                                
  0e21  5f               pop di                                   
  0e22  5e               pop si                                   
  0e23  c9               leave                                    
  0e24  cb               retf                                     

ovl49_0e25:  ; ENTRY
  0e25  55               push bp                                  
  0e26  8bec             mov bp, sp                               
  0e28  56               push si                                  
  0e29  33d2             xor dx, dx                               
  0e2b  33f6             xor si, si                               
  0e2d  eb09             jmp 0xe38                                
  0e2f  80bc124700       cmp byte ptr [si + 0x4712], 0            
  0e34  7401             je 0xe37                                 
  0e36  42               inc dx                                   
  0e37  46               inc si                                   
  0e38  83fe0a           cmp si, 0xa                              
  0e3b  7cf2             jl 0xe2f                                 
  0e3d  8bc2             mov ax, dx                               
  0e3f  5e               pop si                                   
  0e40  5d               pop bp                                   
  0e41  cb               retf                                     

ovl49_0e42:  ; ENTRY
  0e42  55               push bp                                  
  0e43  8bec             mov bp, sp                               
  0e45  56               push si                                  
  0e46  33d2             xor dx, dx                               
  0e48  33f6             xor si, si                               
  0e4a  eb09             jmp 0xe55                                
  0e4c  80bc724600       cmp byte ptr [si + 0x4672], 0            
  0e51  7401             je 0xe54                                 
  0e53  42               inc dx                                   
  0e54  46               inc si                                   
  0e55  83fe0a           cmp si, 0xa                              
  0e58  7cf2             jl 0xe4c                                 
  0e5a  8bc2             mov ax, dx                               
  0e5c  5e               pop si                                   
  0e5d  5d               pop bp                                   
  0e5e  cb               retf                                     

ovl49_0e5f:  ; ENTRY
  0e5f  55               push bp                                  
  0e60  8bec             mov bp, sp                               
  0e62  83ec1c           sub sp, 0x1c                             
  0e65  56               push si                                  
  0e66  57               push di                                  
  0e67  666800000200     push 0x20000                             
  0e6d  6a04             push 4                                   
  0e6f  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0e74  83c404           add sp, 4                                
  0e77  52               push dx                                  
  0e78  50               push ax                                  
  0e79  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0e7e  83c406           add sp, 6                                
  0e81  8946f8           mov word ptr [bp - 8], ax                
  0e84  33ff             xor di, di                               
  0e86  e9ae00           jmp 0xf37                                
  0e89  6a01             push 1                                   
  0e8b  16               push ss                                  
  0e8c  8d46fb           lea ax, [bp - 5]                         
  0e8f  50               push ax                                  
  0e90  ff76f8           push word ptr [bp - 8]                   
  0e93  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0e98  83c408           add sp, 8                                
  0e9b  807efb31         cmp byte ptr [bp - 5], 0x31              
  0e9f  7505             jne 0xea6                                
  0ea1  b80100           mov ax, 1                                
  0ea4  eb02             jmp 0xea8                                
  0ea6  33c0             xor ax, ax                               
  0ea8  8946fe           mov word ptr [bp - 2], ax                
  0eab  6a02             push 2                                   
  0ead  16               push ss                                  
  0eae  8d46e4           lea ax, [bp - 0x1c]                      
  0eb1  50               push ax                                  
  0eb2  ff76f8           push word ptr [bp - 8]                   
  0eb5  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0eba  83c408           add sp, 8                                
  0ebd  c646e600         mov byte ptr [bp - 0x1a], 0              
  0ec1  16               push ss                                  
  0ec2  8d46fc           lea ax, [bp - 4]                         
  0ec5  50               push ax                                  
  0ec6  1e               push ds                                  
  0ec7  68a012           push 0x12a0                              
  0eca  16               push ss                                  
  0ecb  8d46e4           lea ax, [bp - 0x1c]                      
  0ece  50               push ax                                  
  0ecf  9aba490000       lcall 0, 0x49ba                          -> 0000:49ba
  0ed4  83c40c           add sp, 0xc                              
  0ed7  8b46fc           mov ax, word ptr [bp - 4]                
  0eda  40               inc ax                                   
  0edb  50               push ax                                  
  0edc  16               push ss                                  
  0edd  8d46e4           lea ax, [bp - 0x1c]                      
  0ee0  50               push ax                                  
  0ee1  ff76f8           push word ptr [bp - 8]                   
  0ee4  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0ee9  83c408           add sp, 8                                
  0eec  8d46e3           lea ax, [bp - 0x1d]                      
  0eef  8b5efc           mov bx, word ptr [bp - 4]                
  0ef2  03d8             add bx, ax                               
  0ef4  36c60700         mov byte ptr ss:[bx], 0                  
  0ef8  8a46fe           mov al, byte ptr [bp - 2]                
  0efb  88851247         mov byte ptr [di + 0x4712], al           
  0eff  33f6             xor si, si                               
  0f01  eb0b             jmp 0xf0e                                
  0f03  807ae45f         cmp byte ptr [bp + si - 0x1c], 0x5f      
  0f07  7504             jne 0xf0d                                
  0f09  c642e420         mov byte ptr [bp + si - 0x1c], 0x20      
  0f0d  46               inc si                                   
  0f0e  16               push ss                                  
  0f0f  8d46e4           lea ax, [bp - 0x1c]                      
  0f12  50               push ax                                  
  0f13  9a994a0000       lcall 0, 0x4a99                          -> 0000:4a99
  0f18  83c404           add sp, 4                                
  0f1b  3bc6             cmp ax, si                               
  0f1d  7fe4             jg 0xf03                                 
  0f1f  16               push ss                                  
  0f20  8d46e4           lea ax, [bp - 0x1c]                      
  0f23  50               push ax                                  
  0f24  8bc7             mov ax, di                               
  0f26  6bc00f           imul ax, ax, 0xf                         
  0f29  051c47           add ax, 0x471c                           
  0f2c  1e               push ds                                  
  0f2d  50               push ax                                  
  0f2e  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0f33  83c408           add sp, 8                                
  0f36  47               inc di                                   
  0f37  83ff0a           cmp di, 0xa                              
  0f3a  7d03             jge 0xf3f                                
  0f3c  e94aff           jmp 0xe89                                
  0f3f  ff76f8           push word ptr [bp - 8]                   
  0f42  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0f47  59               pop cx                                   
  0f48  5f               pop di                                   
  0f49  5e               pop si                                   
  0f4a  c9               leave                                    
  0f4b  cb               retf                                     

ovl49_0f4c:  ; ENTRY
  0f4c  55               push bp                                  
  0f4d  8bec             mov bp, sp                               
  0f4f  83ec7a           sub sp, 0x7a                             
  0f52  56               push si                                  
  0f53  57               push di                                  
  0f54  666800000100     push 0x10000                             
  0f5a  6a04             push 4                                   
  0f5c  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0f61  83c404           add sp, 4                                
  0f64  52               push dx                                  
  0f65  50               push ax                                  
  0f66  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0f6b  83c406           add sp, 6                                
  0f6e  8946fe           mov word ptr [bp - 2], ax                
  0f71  33ff             xor di, di                               
  0f73  e99e00           jmp 0x1014                               
  0f76  1e               push ds                                  
  0f77  8bc7             mov ax, di                               
  0f79  6bc00f           imul ax, ax, 0xf                         
  0f7c  051c47           add ax, 0x471c                           
  0f7f  50               push ax                                  
  0f80  16               push ss                                  
  0f81  8d46ea           lea ax, [bp - 0x16]                      
  0f84  50               push ax                                  
  0f85  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0f8a  83c408           add sp, 8                                
  0f8d  33f6             xor si, si                               
  0f8f  eb0b             jmp 0xf9c                                
  0f91  807aea20         cmp byte ptr [bp + si - 0x16], 0x20      
  0f95  7504             jne 0xf9b                                
  0f97  c642ea5f         mov byte ptr [bp + si - 0x16], 0x5f      
  0f9b  46               inc si                                   
  0f9c  16               push ss                                  
  0f9d  8d46ea           lea ax, [bp - 0x16]                      
  0fa0  50               push ax                                  
  0fa1  9a994a0000       lcall 0, 0x4a99                          -> 0000:4a99
  0fa6  83c404           add sp, 4                                
  0fa9  3bc6             cmp ax, si                               
  0fab  7fe4             jg 0xf91                                 
  0fad  16               push ss                                  
  0fae  8d46ea           lea ax, [bp - 0x16]                      
  0fb1  50               push ax                                  
  0fb2  9a994a0000       lcall 0, 0x4a99                          -> 0000:4a99
  0fb7  83c404           add sp, 4                                
  0fba  50               push ax                                  
  0fbb  1e               push ds                                  
  0fbc  68a312           push 0x12a3                               ; "%%1d%%02d%%-%ds"
  0fbf  16               push ss                                  
  0fc0  8d4686           lea ax, [bp - 0x7a]                      
  0fc3  50               push ax                                  
  0fc4  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0fc9  83c40a           add sp, 0xa                              
  0fcc  16               push ss                                  
  0fcd  8d46ea           lea ax, [bp - 0x16]                      
  0fd0  50               push ax                                  
  0fd1  16               push ss                                  
  0fd2  50               push ax                                  
  0fd3  9a994a0000       lcall 0, 0x4a99                          -> 0000:4a99
  0fd8  83c404           add sp, 4                                
  0fdb  40               inc ax                                   
  0fdc  50               push ax                                  
  0fdd  8a851247         mov al, byte ptr [di + 0x4712]           
  0fe1  98               cwde                                     
  0fe2  50               push ax                                  
  0fe3  16               push ss                                  
  0fe4  8d4686           lea ax, [bp - 0x7a]                      
  0fe7  50               push ax                                  
  0fe8  16               push ss                                  
  0fe9  8d46b8           lea ax, [bp - 0x48]                      
  0fec  50               push ax                                  
  0fed  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0ff2  83c410           add sp, 0x10                             
  0ff5  16               push ss                                  
  0ff6  8d46b8           lea ax, [bp - 0x48]                      
  0ff9  50               push ax                                  
  0ffa  9a994a0000       lcall 0, 0x4a99                          -> 0000:4a99
  0fff  83c404           add sp, 4                                
  1002  50               push ax                                  
  1003  16               push ss                                  
  1004  8d46b8           lea ax, [bp - 0x48]                      
  1007  50               push ax                                  
  1008  ff76fe           push word ptr [bp - 2]                   
  100b  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  1010  83c408           add sp, 8                                
  1013  47               inc di                                   
  1014  83ff0a           cmp di, 0xa                              
  1017  7d03             jge 0x101c                               
  1019  e95aff           jmp 0xf76                                
  101c  ff76fe           push word ptr [bp - 2]                   
  101f  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  1024  59               pop cx                                   
  1025  5f               pop di                                   
  1026  5e               pop si                                   
  1027  c9               leave                                    
  1028  cb               retf                                     

ovl49_1029:  ; ENTRY
  1029  55               push bp                                  
  102a  8bec             mov bp, sp                               
  102c  83ec1c           sub sp, 0x1c                             
  102f  56               push si                                  
  1030  57               push di                                  
  1031  666800000200     push 0x20000                             
  1037  6a05             push 5                                   
  1039  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  103e  83c404           add sp, 4                                
  1041  52               push dx                                  
  1042  50               push ax                                  
  1043  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  1048  83c406           add sp, 6                                
  104b  8946f8           mov word ptr [bp - 8], ax                
  104e  33ff             xor di, di                               
  1050  e9ae00           jmp 0x1101                               
  1053  6a01             push 1                                   
  1055  16               push ss                                  
  1056  8d46fb           lea ax, [bp - 5]                         
  1059  50               push ax                                  
  105a  ff76f8           push word ptr [bp - 8]                   
  105d  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  1062  83c408           add sp, 8                                
  1065  807efb31         cmp byte ptr [bp - 5], 0x31              
  1069  7505             jne 0x1070                               
  106b  b80100           mov ax, 1                                
  106e  eb02             jmp 0x1072                               
  1070  33c0             xor ax, ax                               
  1072  8946fe           mov word ptr [bp - 2], ax                
  1075  6a02             push 2                                   
  1077  16               push ss                                  
  1078  8d46e4           lea ax, [bp - 0x1c]                      
  107b  50               push ax                                  
  107c  ff76f8           push word ptr [bp - 8]                   
  107f  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  1084  83c408           add sp, 8                                
  1087  c646e600         mov byte ptr [bp - 0x1a], 0              
  108b  16               push ss                                  
  108c  8d46fc           lea ax, [bp - 4]                         
  108f  50               push ax                                  
  1090  1e               push ds                                  
  1091  68b512           push 0x12b5                              
  1094  16               push ss                                  
  1095  8d46e4           lea ax, [bp - 0x1c]                      
  1098  50               push ax                                  
  1099  9aba490000       lcall 0, 0x49ba                          -> 0000:49ba
  109e  83c40c           add sp, 0xc                              
  10a1  8b46fc           mov ax, word ptr [bp - 4]                
  10a4  40               inc ax                                   
  10a5  50               push ax                                  
  10a6  16               push ss                                  
  10a7  8d46e4           lea ax, [bp - 0x1c]                      
  10aa  50               push ax                                  
  10ab  ff76f8           push word ptr [bp - 8]                   
  10ae  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  10b3  83c408           add sp, 8                                
  10b6  8d46e3           lea ax, [bp - 0x1d]                      
  10b9  8b5efc           mov bx, word ptr [bp - 4]                
  10bc  03d8             add bx, ax                               
  10be  36c60700         mov byte ptr ss:[bx], 0                  
  10c2  8a46fe           mov al, byte ptr [bp - 2]                
  10c5  88857246         mov byte ptr [di + 0x4672], al           
  10c9  33f6             xor si, si                               
  10cb  eb0b             jmp 0x10d8                               
  10cd  807ae45f         cmp byte ptr [bp + si - 0x1c], 0x5f      
  10d1  7504             jne 0x10d7                               
  10d3  c642e420         mov byte ptr [bp + si - 0x1c], 0x20      
  10d7  46               inc si                                   
  10d8  16               push ss                                  
  10d9  8d46e4           lea ax, [bp - 0x1c]                      
  10dc  50               push ax                                  
  10dd  9a994a0000       lcall 0, 0x4a99                          -> 0000:4a99
  10e2  83c404           add sp, 4                                
  10e5  3bc6             cmp ax, si                               
  10e7  7fe4             jg 0x10cd                                
  10e9  16               push ss                                  
  10ea  8d46e4           lea ax, [bp - 0x1c]                      
  10ed  50               push ax                                  
  10ee  8bc7             mov ax, di                               
  10f0  6bc00f           imul ax, ax, 0xf                         
  10f3  057c46           add ax, 0x467c                           
  10f6  1e               push ds                                  
  10f7  50               push ax                                  
  10f8  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  10fd  83c408           add sp, 8                                
  1100  47               inc di                                   
  1101  83ff0a           cmp di, 0xa                              
  1104  7d03             jge 0x1109                               
  1106  e94aff           jmp 0x1053                               
  1109  ff76f8           push word ptr [bp - 8]                   
  110c  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  1111  59               pop cx                                   
  1112  5f               pop di                                   
  1113  5e               pop si                                   
  1114  c9               leave                                    
  1115  cb               retf                                     

ovl49_1116:  ; ENTRY
  1116  55               push bp                                  
  1117  8bec             mov bp, sp                               
  1119  83ec7a           sub sp, 0x7a                             
  111c  56               push si                                  
  111d  57               push di                                  
  111e  666800000100     push 0x10000                             
  1124  6a05             push 5                                   
  1126  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  112b  83c404           add sp, 4                                
  112e  52               push dx                                  
  112f  50               push ax                                  
  1130  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  1135  83c406           add sp, 6                                
  1138  8946fe           mov word ptr [bp - 2], ax                
  113b  33ff             xor di, di                               
  113d  e99e00           jmp 0x11de                               
  1140  1e               push ds                                  
  1141  8bc7             mov ax, di                               
  1143  6bc00f           imul ax, ax, 0xf                         
  1146  057c46           add ax, 0x467c                           
  1149  50               push ax                                  
  114a  16               push ss                                  
  114b  8d46ea           lea ax, [bp - 0x16]                      
  114e  50               push ax                                  
  114f  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  1154  83c408           add sp, 8                                
  1157  33f6             xor si, si                               
  1159  eb0b             jmp 0x1166                               
  115b  807aea20         cmp byte ptr [bp + si - 0x16], 0x20      
  115f  7504             jne 0x1165                               
  1161  c642ea5f         mov byte ptr [bp + si - 0x16], 0x5f      
  1165  46               inc si                                   
  1166  16               push ss                                  
  1167  8d46ea           lea ax, [bp - 0x16]                      
  116a  50               push ax                                  
  116b  9a994a0000       lcall 0, 0x4a99                          -> 0000:4a99
  1170  83c404           add sp, 4                                
  1173  3bc6             cmp ax, si                               
  1175  7fe4             jg 0x115b                                
  1177  16               push ss                                  
  1178  8d46ea           lea ax, [bp - 0x16]                      
  117b  50               push ax                                  
  117c  9a994a0000       lcall 0, 0x4a99                          -> 0000:4a99
  1181  83c404           add sp, 4                                
  1184  50               push ax                                  
  1185  1e               push ds                                  
  1186  68b812           push 0x12b8                               ; "%%1d%%02d%%-%ds"
  1189  16               push ss                                  
  118a  8d4686           lea ax, [bp - 0x7a]                      
  118d  50               push ax                                  
  118e  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1193  83c40a           add sp, 0xa                              
  1196  16               push ss                                  
  1197  8d46ea           lea ax, [bp - 0x16]                      
  119a  50               push ax                                  
  119b  16               push ss                                  
  119c  50               push ax                                  
  119d  9a994a0000       lcall 0, 0x4a99                          -> 0000:4a99
  11a2  83c404           add sp, 4                                
  11a5  40               inc ax                                   
  11a6  50               push ax                                  
  11a7  8a857246         mov al, byte ptr [di + 0x4672]           
  11ab  98               cwde                                     
  11ac  50               push ax                                  
  11ad  16               push ss                                  
  11ae  8d4686           lea ax, [bp - 0x7a]                      
  11b1  50               push ax                                  
  11b2  16               push ss                                  
  11b3  8d46b8           lea ax, [bp - 0x48]                      
  11b6  50               push ax                                  
  11b7  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  11bc  83c410           add sp, 0x10                             
  11bf  16               push ss                                  
  11c0  8d46b8           lea ax, [bp - 0x48]                      
  11c3  50               push ax                                  
  11c4  9a994a0000       lcall 0, 0x4a99                          -> 0000:4a99
  11c9  83c404           add sp, 4                                
  11cc  50               push ax                                  
  11cd  16               push ss                                  
  11ce  8d46b8           lea ax, [bp - 0x48]                      
  11d1  50               push ax                                  
  11d2  ff76fe           push word ptr [bp - 2]                   
  11d5  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  11da  83c408           add sp, 8                                
  11dd  47               inc di                                   
  11de  83ff0a           cmp di, 0xa                              
  11e1  7d03             jge 0x11e6                               
  11e3  e95aff           jmp 0x1140                               
  11e6  ff76fe           push word ptr [bp - 2]                   
  11e9  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  11ee  59               pop cx                                   
  11ef  5f               pop di                                   
  11f0  5e               pop si                                   
  11f1  c9               leave                                    
  11f2  cb               retf                                     

ovl49_11f3:  ; ENTRY
  11f3  55               push bp                                  
  11f4  8bec             mov bp, sp                               
  11f6  666a1b           push 0x1b                                
  11f9  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  11fe  83c404           add sp, 4                                
  1201  52               push dx                                  
  1202  50               push ax                                  
  1203  666800000100     push 0x10000                             
  1209  6a00             push 0                                   
  120b  0e               push cs                                  
  120c  e837f8           call 0xa46                               
  120f  83c40a           add sp, 0xa                              
  1212  5d               pop bp                                   
  1213  cb               retf                                     

ovl49_1214:  ; ENTRY
  1214  55               push bp                                  
  1215  8bec             mov bp, sp                               
  1217  56               push si                                  
  1218  b8042c           mov ax, 0x2c04                           
  121b  8ec0             mov es, ax                               
  121d  26833e300100     cmp word ptr es:[0x130], 0               
  1223  7562             jne 0x1287                               
  1225  8ec0             mov es, ax                               
  1227  26833e200100     cmp word ptr es:[0x120], 0               
  122d  7458             je 0x1287                                
  122f  833ec62800       cmp word ptr [0x28c6], 0                 
  1234  7551             jne 0x1287                               
  1236  c7062e480a00     mov word ptr [0x482e], 0xa               
  123c  33f6             xor si, si                               
  123e  eb25             jmp 0x1265                               
  1240  8bde             mov bx, si                               
  1242  d1e3             shl bx, 1                                
  1244  89b7fc4b         mov word ptr [bx + 0x4bfc], si           
  1248  1e               push ds                                  
  1249  8bc6             mov ax, si                               
  124b  6bc00f           imul ax, ax, 0xf                         
  124e  057c46           add ax, 0x467c                           
  1251  50               push ax                                  
  1252  8bc6             mov ax, si                               
  1254  c1e005           shl ax, 5                                
  1257  053c48           add ax, 0x483c                           
  125a  1e               push ds                                  
  125b  50               push ax                                  
  125c  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  1261  83c408           add sp, 8                                
  1264  46               inc si                                   
  1265  83fe0a           cmp si, 0xa                              
  1268  7cd6             jl 0x1240                                
  126a  666a00           push 0                                   
  126d  6a30             push 0x30                                
  126f  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1274  83c404           add sp, 4                                
  1277  52               push dx                                  
  1278  50               push ax                                  
  1279  687f30           push 0x307f                              
  127c  68a200           push 0xa2                                
  127f  9a20009030       lcall 0x3090, 0x20                       -> ovl51:0000
  1284  83c40a           add sp, 0xa                              
  1287  5e               pop si                                   
  1288  5d               pop bp                                   
  1289  cb               retf                                     

ovl49_128a:  ; ENTRY
  128a  55               push bp                                  
  128b  8bec             mov bp, sp                               
  128d  56               push si                                  
  128e  c7062e480000     mov word ptr [0x482e], 0                 
  1294  33f6             xor si, si                               
  1296  eb33             jmp 0x12cb                               
  1298  80bc724600       cmp byte ptr [si + 0x4672], 0            
  129d  742b             je 0x12ca                                
  129f  8b1e2e48         mov bx, word ptr [0x482e]                
  12a3  d1e3             shl bx, 1                                
  12a5  89b7fc4b         mov word ptr [bx + 0x4bfc], si           
  12a9  1e               push ds                                  
  12aa  8bc6             mov ax, si                               
  12ac  6bc00f           imul ax, ax, 0xf                         
  12af  057c46           add ax, 0x467c                           
  12b2  50               push ax                                  
  12b3  a12e48           mov ax, word ptr [0x482e]                
  12b6  c1e005           shl ax, 5                                
  12b9  053c48           add ax, 0x483c                           
  12bc  1e               push ds                                  
  12bd  50               push ax                                  
  12be  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  12c3  83c408           add sp, 8                                
  12c6  ff062e48         inc word ptr [0x482e]                    
  12ca  46               inc si                                   
  12cb  83fe0a           cmp si, 0xa                              
  12ce  7cc8             jl 0x1298                                
  12d0  ff369012         push word ptr [0x1290]                   
  12d4  666a31           push 0x31                                
  12d7  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  12dc  83c404           add sp, 4                                
  12df  52               push dx                                  
  12e0  50               push ax                                  
  12e1  687f30           push 0x307f                              
  12e4  689d00           push 0x9d                                
  12e7  9a20009030       lcall 0x3090, 0x20                       -> ovl51:0000
  12ec  83c40a           add sp, 0xa                              
  12ef  5e               pop si                                   
  12f0  5d               pop bp                                   
  12f1  cb               retf                                     

ovl49_12f2:  ; ENTRY
  12f2  55               push bp                                  
  12f3  8bec             mov bp, sp                               
  12f5  56               push si                                  
  12f6  8b7606           mov si, word ptr [bp + 6]                
  12f9  83feff           cmp si, -1                               
  12fc  753a             jne 0x1338                               
  12fe  833ec62800       cmp word ptr [0x28c6], 0                 
  1303  740a             je 0x130f                                
  1305  6a00             push 0                                   
  1307  9a2000cc30       lcall 0x30cc, 0x20                       -> ovl60:0000
  130c  e9af00           jmp 0x13be                               
  130f  833e862a00       cmp word ptr [0x2a86], 0                 
  1314  740e             je 0x1324                                
  1316  666a00           push 0                                   
  1319  9a2000d730       lcall 0x30d7, 0x20                       -> ovl61:0000
  131e  83c404           add sp, 4                                
  1321  e99b00           jmp 0x13bf                               
  1324  666800000100     push 0x10000                             
  132a  666a00           push 0                                   
  132d  9a2f00ab30       lcall 0x30ab, 0x2f                       -> ovl57:0000
  1332  83c408           add sp, 8                                
  1335  e98700           jmp 0x13bf                               
  1338  8bc6             mov ax, si                               
  133a  a38c12           mov word ptr [0x128c], ax                
  133d  a39012           mov word ptr [0x1290], ax                
  1340  666800000100     push 0x10000                             
  1346  56               push si                                  
  1347  0e               push cs                                  
  1348  e8c9f0           call 0x414                               
  134b  83c406           add sp, 6                                
  134e  666a1b           push 0x1b                                
  1351  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  1356  83c404           add sp, 4                                
  1359  52               push dx                                  
  135a  50               push ax                                  
  135b  56               push si                                  
  135c  6a1a             push 0x1a                                
  135e  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  1363  83c404           add sp, 4                                
  1366  52               push dx                                  
  1367  50               push ax                                  
  1368  0e               push cs                                  
  1369  e8f5f9           call 0xd61                               
  136c  83c408           add sp, 8                                
  136f  9a2a00e830       lcall 0x30e8, 0x2a                       -> ovl62:03f9
  1374  9a2f00e830       lcall 0x30e8, 0x2f                       -> ovl62:02bf
  1379  9a3400e830       lcall 0x30e8, 0x34                       -> ovl62:0372
  137e  6a01             push 1                                   
  1380  b8042c           mov ax, 0x2c04                           
  1383  8ec0             mov es, ax                               
  1385  26ff361001       push word ptr es:[0x110]                 
  138a  9a9e0d5505       lcall 0x555, 0xd9e                       -> 0555:0d9e
  138f  83c404           add sp, 4                                
  1392  666800000100     push 0x10000                             
  1398  666800000100     push 0x10000                             
  139e  9a2f00ab30       lcall 0x30ab, 0x2f                       -> ovl57:0000
  13a3  83c408           add sp, 8                                
  13a6  c706c6280000     mov word ptr [0x28c6], 0                 
  13ac  c706862a0000     mov word ptr [0x2a86], 0                 
  13b2  9a8400e830       lcall 0x30e8, 0x84                       -> ovl62:0af3
  13b7  6a00             push 0                                   
  13b9  9a2000ba30       lcall 0x30ba, 0x20                       -> ovl58:0000
  13be  59               pop cx                                   
  13bf  5e               pop si                                   
  13c0  5d               pop bp                                   
  13c1  cb               retf                                     

ovl49_13c2:  ; ENTRY
  13c2  55               push bp                                  
  13c3  8bec             mov bp, sp                               
  13c5  8b5606           mov dx, word ptr [bp + 6]                
  13c8  83faff           cmp dx, -1                               
  13cb  7539             jne 0x1406                               
  13cd  833ec62800       cmp word ptr [0x28c6], 0                 
  13d2  740b             je 0x13df                                
  13d4  6a00             push 0                                   
  13d6  9a2000cc30       lcall 0x30cc, 0x20                       -> ovl60:0000
  13db  59               pop cx                                   
  13dc  e98200           jmp 0x1461                               
  13df  833e862a00       cmp word ptr [0x2a86], 0                 
  13e4  740d             je 0x13f3                                
  13e6  666a00           push 0                                   
  13e9  9a2000d730       lcall 0x30d7, 0x20                       -> ovl61:0000
  13ee  83c404           add sp, 4                                
  13f1  eb6e             jmp 0x1461                               
  13f3  666800000100     push 0x10000                             
  13f9  666a00           push 0                                   
  13fc  9a2f00ab30       lcall 0x30ab, 0x2f                       -> ovl57:0000
  1401  83c408           add sp, 8                                
  1404  eb5b             jmp 0x1461                               
  1406  8bc2             mov ax, dx                               
  1408  a38c12           mov word ptr [0x128c], ax                
  140b  a39012           mov word ptr [0x1290], ax                
  140e  66680f00a000     push 0xa0000f                            
  1414  6a01             push 1                                   
  1416  681430           push 0x3014                              
  1419  685700           push 0x57                                
  141c  687f30           push 0x307f                              
  141f  68a700           push 0xa7                                
  1422  8bc2             mov ax, dx                               
  1424  6bc00f           imul ax, ax, 0xf                         
  1427  057c46           add ax, 0x467c                           
  142a  1e               push ds                                  
  142b  50               push ax                                  
  142c  666830000200     push 0x20030                             
  1432  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1437  83c404           add sp, 4                                
  143a  52               push dx                                  
  143b  50               push ax                                  
  143c  666830000100     push 0x10030                             
  1442  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1447  83c404           add sp, 4                                
  144a  52               push dx                                  
  144b  50               push ax                                  
  144c  666a30           push 0x30                                
  144f  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1454  83c404           add sp, 4                                
  1457  52               push dx                                  
  1458  50               push ax                                  
  1459  9a2000a530       lcall 0x30a5, 0x20                       -> ovl56:0000
  145e  83c41e           add sp, 0x1e                             
  1461  5d               pop bp                                   
  1462  cb               retf                                     

ovl49_1463:  ; ENTRY
  1463  55               push bp                                  
  1464  8bec             mov bp, sp                               
  1466  83ec50           sub sp, 0x50                             
  1469  8b1e8c12         mov bx, word ptr [0x128c]                
  146d  c687724601       mov byte ptr [bx + 0x4672], 1            
  1472  66ff7606         push dword ptr [bp + 6]                  
  1476  a18c12           mov ax, word ptr [0x128c]                
  1479  6bc00f           imul ax, ax, 0xf                         
  147c  057c46           add ax, 0x467c                           
  147f  1e               push ds                                  
  1480  50               push ax                                  
  1481  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  1486  83c408           add sp, 8                                
  1489  0e               push cs                                  
  148a  e889fc           call 0x1116                              
  148d  ff368c12         push word ptr [0x128c]                   
  1491  6a1a             push 0x1a                                
  1493  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  1498  83c404           add sp, 4                                
  149b  52               push dx                                  
  149c  50               push ax                                  
  149d  16               push ss                                  
  149e  8d46d8           lea ax, [bp - 0x28]                      
  14a1  50               push ax                                  
  14a2  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  14a7  83c408           add sp, 8                                
  14aa  666a1b           push 0x1b                                
  14ad  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  14b2  83c404           add sp, 4                                
  14b5  52               push dx                                  
  14b6  50               push ax                                  
  14b7  16               push ss                                  
  14b8  8d46b0           lea ax, [bp - 0x50]                      
  14bb  50               push ax                                  
  14bc  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  14c1  83c408           add sp, 8                                
  14c4  16               push ss                                  
  14c5  8d46d8           lea ax, [bp - 0x28]                      
  14c8  50               push ax                                  
  14c9  16               push ss                                  
  14ca  8d46b0           lea ax, [bp - 0x50]                      
  14cd  50               push ax                                  
  14ce  0e               push cs                                  
  14cf  e88ff8           call 0xd61                               
  14d2  83c408           add sp, 8                                
  14d5  833ec62800       cmp word ptr [0x28c6], 0                 
  14da  740a             je 0x14e6                                
  14dc  6a00             push 0                                   
  14de  9a2000cc30       lcall 0x30cc, 0x20                       -> ovl60:0000
  14e3  59               pop cx                                   
  14e4  eb25             jmp 0x150b                               
  14e6  833e862a00       cmp word ptr [0x2a86], 0                 
  14eb  740d             je 0x14fa                                
  14ed  666a00           push 0                                   
  14f0  9a2000d730       lcall 0x30d7, 0x20                       -> ovl61:0000
  14f5  83c404           add sp, 4                                
  14f8  eb11             jmp 0x150b                               
  14fa  666800000100     push 0x10000                             
  1500  666a00           push 0                                   
  1503  9a2f00ab30       lcall 0x30ab, 0x2f                       -> ovl57:0000
  1508  83c408           add sp, 8                                
  150b  c9               leave                                    
  150c  cb               retf                                     

ovl49_150d:  ; ENTRY
  150d  55               push bp                                  
  150e  8bec             mov bp, sp                               
  1510  b8042c           mov ax, 0x2c04                           
  1513  8ec0             mov es, ax                               
  1515  268b1e1001       mov bx, word ptr es:[0x110]              
  151a  d1e3             shl bx, 1                                
  151c  83bfea5d00       cmp word ptr [bx + 0x5dea], 0            
  1521  7503             jne 0x1526                               
  1523  e9e000           jmp 0x1606                               
  1526  c7066a160100     mov word ptr [0x166a], 1                 
  152c  6a01             push 1                                   
  152e  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  1533  59               pop cx                                   
  1534  666800000300     push 0x30000                             
  153a  666801000f00     push 0xf0001                             
  1540  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  1545  83c408           add sp, 8                                
  1548  6668a5000000     push 0xa5                                
  154e  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1553  83c404           add sp, 4                                
  1556  52               push dx                                  
  1557  50               push ax                                  
  1558  666840015c00     push 0x5c0140                            
  155e  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1563  83c408           add sp, 8                                
  1566  666800000300     push 0x30000                             
  156c  666802000f00     push 0xf0002                             
  1572  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  1577  83c408           add sp, 8                                
  157a  6668a5000100     push 0x100a5                             
  1580  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1585  83c404           add sp, 4                                
  1588  52               push dx                                  
  1589  50               push ax                                  
  158a  666840018c00     push 0x8c0140                            
  1590  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1595  83c408           add sp, 8                                
  1598  6668a5000200     push 0x200a5                             
  159e  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  15a3  83c404           add sp, 4                                
  15a6  52               push dx                                  
  15a7  50               push ax                                  
  15a8  66684001a000     push 0xa00140                            
  15ae  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  15b3  83c408           add sp, 8                                
  15b6  6668a5000300     push 0x300a5                             
  15bc  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  15c1  83c404           add sp, 4                                
  15c4  52               push dx                                  
  15c5  50               push ax                                  
  15c6  66684001b400     push 0xb40140                            
  15cc  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  15d1  83c408           add sp, 8                                
  15d4  6a21             push 0x21                                
  15d6  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  15db  59               pop cx                                   
  15dc  6668e7010100     push 0x101e7                             
  15e2  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  15e7  83c404           add sp, 4                                
  15ea  6668e8010100     push 0x101e8                             
  15f0  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  15f5  83c404           add sp, 4                                
  15f8  6668e9010100     push 0x101e9                             
  15fe  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1603  83c404           add sp, 4                                
  1606  5d               pop bp                                   
  1607  cb               retf                                     

ovl49_1608:  ; ENTRY
  1608  55               push bp                                  
  1609  8bec             mov bp, sp                               
  160b  56               push si                                  
  160c  57               push di                                  
  160d  8b7e06           mov di, word ptr [bp + 6]                
  1610  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  1615  c7066a160000     mov word ptr [0x166a], 0                 
  161b  0bff             or di, di                                
  161d  7575             jne 0x1694                               
  161f  6668a5000600     push 0x600a5                             
  1625  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  162a  83c404           add sp, 4                                
  162d  52               push dx                                  
  162e  50               push ax                                  
  162f  9a8900d730       lcall 0x30d7, 0x89                       -> ovl61:10fb
  1634  83c404           add sp, 4                                
  1637  6668a5000700     push 0x700a5                             
  163d  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1642  83c404           add sp, 4                                
  1645  52               push dx                                  
  1646  50               push ax                                  
  1647  9a8900d730       lcall 0x30d7, 0x89                       -> ovl61:10fb
  164c  83c404           add sp, 4                                
  164f  6668a5000800     push 0x800a5                             
  1655  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  165a  83c404           add sp, 4                                
  165d  52               push dx                                  
  165e  50               push ax                                  
  165f  9a8900d730       lcall 0x30d7, 0x89                       -> ovl61:10fb
  1664  83c404           add sp, 4                                
  1667  6668a5000a00     push 0xa00a5                             
  166d  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1672  83c404           add sp, 4                                
  1675  52               push dx                                  
  1676  50               push ax                                  
  1677  6668a5000900     push 0x900a5                             
  167d  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1682  83c404           add sp, 4                                
  1685  52               push dx                                  
  1686  50               push ax                                  
  1687  9a8e00d730       lcall 0x30d7, 0x8e                       -> ovl61:1160
  168c  83c408           add sp, 8                                
  168f  9a3900f930       lcall 0x30f9, 0x39                       -> ovl64:006c
  1694  33f6             xor si, si                               
  1696  eb45             jmp 0x16dd                               
  1698  8bde             mov bx, si                               
  169a  6bdb41           imul bx, bx, 0x41                        
  169d  b8042c           mov ax, 0x2c04                           
  16a0  8ec0             mov es, ax                               
  16a2  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  16a7  98               cwde                                     
  16a8  ba042c           mov dx, 0x2c04                           
  16ab  8ec2             mov es, dx                               
  16ad  263b061001       cmp ax, word ptr es:[0x110]              
  16b2  7528             jne 0x16dc                               
  16b4  6a00             push 0                                   
  16b6  8bde             mov bx, si                               
  16b8  6bdb41           imul bx, bx, 0x41                        
  16bb  b8042c           mov ax, 0x2c04                           
  16be  8ec0             mov es, ax                               
  16c0  26ffb77f15       push word ptr es:[bx + 0x157f]           
  16c5  8bde             mov bx, si                               
  16c7  6bdb41           imul bx, bx, 0x41                        
  16ca  b8042c           mov ax, 0x2c04                           
  16cd  8ec0             mov es, ax                               
  16cf  26ffb77d15       push word ptr es:[bx + 0x157d]           
  16d4  9a34000b30       lcall 0x300b, 0x34                       -> ovl32:016b
  16d9  83c406           add sp, 6                                
  16dc  46               inc si                                   
  16dd  b8042c           mov ax, 0x2c04                           
  16e0  8ec0             mov es, ax                               
  16e2  2639367b15       cmp word ptr es:[0x157b], si             
  16e7  7faf             jg 0x1698                                
  16e9  8ec0             mov es, ax                               
  16eb  268b368101       mov si, word ptr es:[0x181]              
  16f0  e98000           jmp 0x1773                               
  16f3  8bde             mov bx, si                               
  16f5  6bdb16           imul bx, bx, 0x16                        
  16f8  b81d1e           mov ax, 0x1e1d                           
  16fb  8ec0             mov es, ax                               
  16fd  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  1702  98               cwde                                     
  1703  ba042c           mov dx, 0x2c04                           
  1706  8ec2             mov es, dx                               
  1708  263b061001       cmp ax, word ptr es:[0x110]              
  170d  7564             jne 0x1773                               
  170f  8bde             mov bx, si                               
  1711  6bdb16           imul bx, bx, 0x16                        
  1714  b81d1e           mov ax, 0x1e1d                           
  1717  8ec0             mov es, ax                               
  1719  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  171f  7538             jne 0x1759                               
  1721  8bde             mov bx, si                               
  1723  6bdb16           imul bx, bx, 0x16                        
  1726  b81d1e           mov ax, 0x1e1d                           
  1729  8ec0             mov es, ax                               
  172b  26ffb78288       push word ptr es:[bx - 0x777e]           
  1730  8bde             mov bx, si                               
  1732  6bdb16           imul bx, bx, 0x16                        
  1735  b81d1e           mov ax, 0x1e1d                           
  1738  8ec0             mov es, ax                               
  173a  26ffb78088       push word ptr es:[bx - 0x7780]           
  173f  8bc6             mov ax, si                               
  1741  6bc016           imul ax, ax, 0x16                        
  1744  ba0000           mov dx, 0                                
  1747  03d0             add dx, ax                               
  1749  81c28088         add dx, 0x8880                           
  174d  681d1e           push 0x1e1d                              
  1750  52               push dx                                  
  1751  9a39002430       lcall 0x3024, 0x39                       -> ovl36:16cd
  1756  83c408           add sp, 8                                
  1759  8bc6             mov ax, si                               
  175b  6bc016           imul ax, ax, 0x16                        
  175e  ba0000           mov dx, 0                                
  1761  03d0             add dx, ax                               
  1763  81c28088         add dx, 0x8880                           
  1767  681d1e           push 0x1e1d                              
  176a  52               push dx                                  
  176b  9abe03620b       lcall 0xb62, 0x3be                       -> 0b62:03be
  1770  83c404           add sp, 4                                
  1773  8bc6             mov ax, si                               
  1775  4e               dec si                                   
  1776  0bc0             or ax, ax                                
  1778  7403             je 0x177d                                
  177a  e976ff           jmp 0x16f3                               
  177d  b8042c           mov ax, 0x2c04                           
  1780  8ec0             mov es, ax                               
  1782  26833e240100     cmp word ptr es:[0x124], 0               
  1788  7437             je 0x17c1                                
  178a  33d2             xor dx, dx                               
  178c  eb1e             jmp 0x17ac                               
  178e  33c9             xor cx, cx                               
  1790  eb13             jmp 0x17a5                               
  1792  8bd9             mov bx, cx                               
  1794  6bdb70           imul bx, bx, 0x70                        
  1797  03da             add bx, dx                               
  1799  b8d919           mov ax, 0x19d9                           
  179c  8ec0             mov es, ax                               
  179e  26808f000020     or byte ptr es:[bx], 0x20                
  17a4  41               inc cx                                   
  17a5  81f99c00         cmp cx, 0x9c                             
  17a9  7ce7             jl 0x1792                                
  17ab  42               inc dx                                   
  17ac  83fa70           cmp dx, 0x70                             
  17af  7cdd             jl 0x178e                                
  17b1  b8042c           mov ax, 0x2c04                           
  17b4  8ec0             mov es, ax                               
  17b6  26ff361001       push word ptr es:[0x110]                 
  17bb  9a5200f230       lcall 0x30f2, 0x52                       -> ovl63:2200
  17c0  59               pop cx                                   
  17c1  6633c0           xor eax, eax                             
  17c4  66a35e5e         mov dword ptr [0x5e5e], eax              
  17c8  66a3625e         mov dword ptr [0x5e62], eax              
  17cc  33f6             xor si, si                               
  17ce  eb12             jmp 0x17e2                               
  17d0  8bde             mov bx, si                               
  17d2  c1e302           shl bx, 2                                
  17d5  c787405e0000     mov word ptr [bx + 0x5e40], 0            
  17db  c7873e5e0000     mov word ptr [bx + 0x5e3e], 0            
  17e1  46               inc si                                   
  17e2  83fe08           cmp si, 8                                
  17e5  7ce9             jl 0x17d0                                
  17e7  9a2500e830       lcall 0x30e8, 0x25                       -> ovl62:0000
  17ec  9a8400e830       lcall 0x30e8, 0x84                       -> ovl62:0af3
  17f1  666801000100     push 0x10001                             
  17f7  6a01             push 1                                   
  17f9  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  17fe  83c406           add sp, 6                                
  1801  83ff01           cmp di, 1                                
  1804  7528             jne 0x182e                               
  1806  6668a5000500     push 0x500a5                             
  180c  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1811  83c404           add sp, 4                                
  1814  52               push dx                                  
  1815  50               push ax                                  
  1816  6668a5000400     push 0x400a5                             
  181c  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1821  83c404           add sp, 4                                
  1824  52               push dx                                  
  1825  50               push ax                                  
  1826  9a8e00d730       lcall 0x30d7, 0x8e                       -> ovl61:1160
  182b  83c408           add sp, 8                                
  182e  5f               pop di                                   
  182f  5e               pop si                                   
  1830  5d               pop bp                                   
  1831  cb               retf                                     

ovl49_1832:  ; ENTRY
  1832  55               push bp                                  
  1833  8bec             mov bp, sp                               
  1835  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  183a  c7066a160000     mov word ptr [0x166a], 0                 
  1840  666801000100     push 0x10001                             
  1846  6a01             push 1                                   
  1848  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  184d  83c406           add sp, 6                                
  1850  5d               pop bp                                   
  1851  cb               retf                                     
