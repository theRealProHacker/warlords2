; ovl38 stub 3030 file_off 0x5ed00 size 0x14d6

ovl38_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec02           sub sp, 2                                
  0006  8b5606           mov dx, word ptr [bp + 6]                
  0009  8b4e08           mov cx, word ptr [bp + 8]                
  000c  8bd9             mov bx, cx                               
  000e  69dbe000         imul bx, bx, 0xe0                        
  0012  8bc2             mov ax, dx                               
  0014  d1e0             shl ax, 1                                
  0016  03d8             add bx, ax                               
  0018  b81d1e           mov ax, 0x1e1d                           
  001b  8ec0             mov es, ax                               
  001d  268a9f0000       mov bl, byte ptr es:[bx]                 
  0022  81e3ff00         and bx, 0xff                             
  0026  b8042c           mov ax, 0x2c04                           
  0029  8ec0             mov es, ax                               
  002b  268a871007       mov al, byte ptr es:[bx + 0x710]         
  0030  98               cwde                                     
  0031  8946fe           mov word ptr [bp - 2], ax                
  0034  8bd9             mov bx, cx                               
  0036  69dbe000         imul bx, bx, 0xe0                        
  003a  8bc2             mov ax, dx                               
  003c  d1e0             shl ax, 1                                
  003e  03d8             add bx, ax                               
  0040  b81d1e           mov ax, 0x1e1d                           
  0043  8ec0             mov es, ax                               
  0045  268a870100       mov al, byte ptr es:[bx + 1]             
  004a  c1e805           shr ax, 5                                
  004d  250100           and ax, 1                                
  0050  0bc0             or ax, ax                                
  0052  7404             je 0x58                                  
  0054  33c0             xor ax, ax                               
  0056  eb21             jmp 0x79                                 
  0058  8b5efe           mov bx, word ptr [bp - 2]                
  005b  83eb04           sub bx, 4                                
  005e  83fb07           cmp bx, 7                                
  0061  7713             ja 0x76                                  
  0063  d1e3             shl bx, 1                                
  0065  2effa77b00       jmp word ptr cs:[bx + 0x7b]              
ovl38_006a:  ; case
  006a  ebe8             jmp 0x54                                 
ovl38_006c:  ; case
  006c  b80200           mov ax, 2                                
  006f  eb08             jmp 0x79                                 
ovl38_0071:  ; case
  0071  b80300           mov ax, 3                                
  0074  eb03             jmp 0x79                                 
ovl38_0076:  ; case
  0076  b80100           mov ax, 1                                
  0079  c9               leave                                    
  007a  cb               retf                                     
  007b  6c00710071007600 dw 006c,0071,0071,0076,0076,0076,006a,006a jump table

ovl38_008b:  ; ENTRY
  008b  55               push bp                                  
  008c  8bec             mov bp, sp                               
  008e  81ec9000         sub sp, 0x90                             
  0092  56               push si                                  
  0093  57               push di                                  
  0094  c746f40000       mov word ptr [bp - 0xc], 0               
  0099  c746f00000       mov word ptr [bp - 0x10], 0              
  009e  c746ee0000       mov word ptr [bp - 0x12], 0              
  00a3  c746ea0000       mov word ptr [bp - 0x16], 0              
  00a8  c746e80000       mov word ptr [bp - 0x18], 0              
  00ad  33ff             xor di, di                               
  00af  c746e40000       mov word ptr [bp - 0x1c], 0              
  00b4  c746e20000       mov word ptr [bp - 0x1e], 0              
  00b9  c746e00000       mov word ptr [bp - 0x20], 0              
  00be  c746de0000       mov word ptr [bp - 0x22], 0              
  00c3  c746dc0000       mov word ptr [bp - 0x24], 0              
  00c8  c746da0000       mov word ptr [bp - 0x26], 0              
  00cd  c746d80000       mov word ptr [bp - 0x28], 0              
  00d2  ff7608           push word ptr [bp + 8]                   
  00d5  ff7606           push word ptr [bp + 6]                   
  00d8  0e               push cs                                  
  00d9  e824ff           call 0                                   
  00dc  83c404           add sp, 4                                
  00df  8946d6           mov word ptr [bp - 0x2a], ax             
  00e2  b8042c           mov ax, 0x2c04                           
  00e5  8ec0             mov es, ax                               
  00e7  26a01001         mov al, byte ptr es:[0x110]              
  00eb  a2fa41           mov byte ptr [0x41fa], al                
  00ee  8b5e08           mov bx, word ptr [bp + 8]                
  00f1  69dbe000         imul bx, bx, 0xe0                        
  00f5  8b4606           mov ax, word ptr [bp + 6]                
  00f8  d1e0             shl ax, 1                                
  00fa  03d8             add bx, ax                               
  00fc  b81d1e           mov ax, 0x1e1d                           
  00ff  8ec0             mov es, ax                               
  0101  268a870100       mov al, byte ptr es:[bx + 1]             
  0106  250f00           and ax, 0xf                              
  0109  a2fb41           mov byte ptr [0x41fb], al                
  010c  803efb4108       cmp byte ptr [0x41fb], 8                 
  0111  7d03             jge 0x116                                
  0113  98               cwde                                     
  0114  eb03             jmp 0x119                                
  0116  b80800           mov ax, 8                                
  0119  8946f6           mov word ptr [bp - 0xa], ax              
  011c  8b5e08           mov bx, word ptr [bp + 8]                
  011f  69dbe000         imul bx, bx, 0xe0                        
  0123  8b4606           mov ax, word ptr [bp + 6]                
  0126  d1e0             shl ax, 1                                
  0128  03d8             add bx, ax                               
  012a  b81d1e           mov ax, 0x1e1d                           
  012d  8ec0             mov es, ax                               
  012f  268a9f0000       mov bl, byte ptr es:[bx]                 
  0134  81e3ff00         and bx, 0xff                             
  0138  b8042c           mov ax, 0x2c04                           
  013b  8ec0             mov es, ax                               
  013d  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  0143  7403             je 0x148                                 
  0145  e91601           jmp 0x25e                                
  0148  c606f14104       mov byte ptr [0x41f1], 4                 
  014d  33f6             xor si, si                               
  014f  eb53             jmp 0x1a4                                
  0151  8bde             mov bx, si                               
  0153  6bdb41           imul bx, bx, 0x41                        
  0156  b8042c           mov ax, 0x2c04                           
  0159  8ec0             mov es, ax                               
  015b  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0160  3b4606           cmp ax, word ptr [bp + 6]                
  0163  7415             je 0x17a                                 
  0165  8bde             mov bx, si                               
  0167  6bdb41           imul bx, bx, 0x41                        
  016a  b8042c           mov ax, 0x2c04                           
  016d  8b5606           mov dx, word ptr [bp + 6]                
  0170  4a               dec dx                                   
  0171  8ec0             mov es, ax                               
  0173  2639977d15       cmp word ptr es:[bx + 0x157d], dx        
  0178  7529             jne 0x1a3                                
  017a  8bde             mov bx, si                               
  017c  6bdb41           imul bx, bx, 0x41                        
  017f  b8042c           mov ax, 0x2c04                           
  0182  8ec0             mov es, ax                               
  0184  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0189  3b4608           cmp ax, word ptr [bp + 8]                
  018c  7422             je 0x1b0                                 
  018e  8bde             mov bx, si                               
  0190  6bdb41           imul bx, bx, 0x41                        
  0193  b8042c           mov ax, 0x2c04                           
  0196  8b5608           mov dx, word ptr [bp + 8]                
  0199  4a               dec dx                                   
  019a  8ec0             mov es, ax                               
  019c  2639977f15       cmp word ptr es:[bx + 0x157f], dx        
  01a1  740d             je 0x1b0                                 
  01a3  46               inc si                                   
  01a4  b8042c           mov ax, 0x2c04                           
  01a7  8ec0             mov es, ax                               
  01a9  2639367b15       cmp word ptr es:[0x157b], si             
  01ae  7fa1             jg 0x151                                 
  01b0  a0f141           mov al, byte ptr [0x41f1]                
  01b3  98               cwde                                     
  01b4  8bc8             mov cx, ax                               
  01b6  e98800           jmp 0x241                                
  01b9  8bde             mov bx, si                               
  01bb  6bdb41           imul bx, bx, 0x41                        
  01be  b8042c           mov ax, 0x2c04                           
  01c1  8ec0             mov es, ax                               
  01c3  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  01c8  8bd9             mov bx, cx                               
  01ca  d1e3             shl bx, 1                                
  01cc  03874e0d         add ax, word ptr [bx + 0xd4e]            
  01d0  69c0e000         imul ax, ax, 0xe0                        
  01d4  8bde             mov bx, si                               
  01d6  6bdb41           imul bx, bx, 0x41                        
  01d9  ba042c           mov dx, 0x2c04                           
  01dc  8ec2             mov es, dx                               
  01de  268b977d15       mov dx, word ptr es:[bx + 0x157d]        
  01e3  8bd9             mov bx, cx                               
  01e5  d1e3             shl bx, 1                                
  01e7  0397460d         add dx, word ptr [bx + 0xd46]            
  01eb  d1e2             shl dx, 1                                
  01ed  03c2             add ax, dx                               
  01ef  ba1d1e           mov dx, 0x1e1d                           
  01f2  8bd8             mov bx, ax                               
  01f4  8ec2             mov es, dx                               
  01f6  268b870000       mov ax, word ptr es:[bx]                 
  01fb  8bd9             mov bx, cx                               
  01fd  d1e3             shl bx, 1                                
  01ff  8987f241         mov word ptr [bx + 0x41f2], ax           
  0203  8bde             mov bx, si                               
  0205  6bdb41           imul bx, bx, 0x41                        
  0208  b8042c           mov ax, 0x2c04                           
  020b  8ec0             mov es, ax                               
  020d  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0212  8bd9             mov bx, cx                               
  0214  d1e3             shl bx, 1                                
  0216  0387460d         add ax, word ptr [bx + 0xd46]            
  021a  8bd9             mov bx, cx                               
  021c  d1e3             shl bx, 1                                
  021e  8987e941         mov word ptr [bx + 0x41e9], ax           
  0222  8bde             mov bx, si                               
  0224  6bdb41           imul bx, bx, 0x41                        
  0227  b8042c           mov ax, 0x2c04                           
  022a  8ec0             mov es, ax                               
  022c  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0231  8bd9             mov bx, cx                               
  0233  d1e3             shl bx, 1                                
  0235  03874e0d         add ax, word ptr [bx + 0xd4e]            
  0239  8bd9             mov bx, cx                               
  023b  d1e3             shl bx, 1                                
  023d  8987e141         mov word ptr [bx + 0x41e1], ax           
  0241  8bc1             mov ax, cx                               
  0243  49               dec cx                                   
  0244  0bc0             or ax, ax                                
  0246  7403             je 0x24b                                 
  0248  e96eff           jmp 0x1b9                                
  024b  8bc6             mov ax, si                               
  024d  6bc041           imul ax, ax, 0x41                        
  0250  057d15           add ax, 0x157d                           
  0253  c706df41042c     mov word ptr [0x41df], 0x2c04            
  0259  a3dd41           mov word ptr [0x41dd], ax                
  025c  eb35             jmp 0x293                                
  025e  c606f14101       mov byte ptr [0x41f1], 1                 
  0263  8b5e08           mov bx, word ptr [bp + 8]                
  0266  69dbe000         imul bx, bx, 0xe0                        
  026a  8b4606           mov ax, word ptr [bp + 6]                
  026d  d1e0             shl ax, 1                                
  026f  03d8             add bx, ax                               
  0271  b81d1e           mov ax, 0x1e1d                           
  0274  8ec0             mov es, ax                               
  0276  268b870000       mov ax, word ptr es:[bx]                 
  027b  a3f241           mov word ptr [0x41f2], ax                
  027e  8b4606           mov ax, word ptr [bp + 6]                
  0281  a3e941           mov word ptr [0x41e9], ax                
  0284  8b4608           mov ax, word ptr [bp + 8]                
  0287  a3e141           mov word ptr [0x41e1], ax                
  028a  66c706dd41000000 mov dword ptr [0x41dd], 0                
  0293  833eda2b00       cmp word ptr [0x2bda], 0                 
  0298  7405             je 0x29f                                 
  029a  a0fe5d           mov al, byte ptr [0x5dfe]                
  029d  eb02             jmp 0x2a1                                
  029f  b001             mov al, 1                                
  02a1  a2c442           mov byte ptr [0x42c4], al                
  02a4  33f6             xor si, si                               
  02a6  eb06             jmp 0x2ae                                
  02a8  c684244201       mov byte ptr [si + 0x4224], 1            
  02ad  46               inc si                                   
  02ae  a0c442           mov al, byte ptr [0x42c4]                
  02b1  98               cwde                                     
  02b2  3bc6             cmp ax, si                               
  02b4  7ff2             jg 0x2a8                                 
  02b6  833eda2b00       cmp word ptr [0x2bda], 0                 
  02bb  7429             je 0x2e6                                 
  02bd  33f6             xor si, si                               
  02bf  eb1b             jmp 0x2dc                                
  02c1  8bde             mov bx, si                               
  02c3  c1e302           shl bx, 2                                
  02c6  8b87405e         mov ax, word ptr [bx + 0x5e40]           
  02ca  8b973e5e         mov dx, word ptr [bx + 0x5e3e]           
  02ce  8bde             mov bx, si                               
  02d0  c1e302           shl bx, 2                                
  02d3  8987c842         mov word ptr [bx + 0x42c8], ax           
  02d7  8997c642         mov word ptr [bx + 0x42c6], dx           
  02db  46               inc si                                   
  02dc  a0c442           mov al, byte ptr [0x42c4]                
  02df  98               cwde                                     
  02e0  3bc6             cmp ax, si                               
  02e2  7fdd             jg 0x2c1                                 
  02e4  eb08             jmp 0x2ee                                
  02e6  66a1625e         mov eax, dword ptr [0x5e62]              
  02ea  66a3c642         mov dword ptr [0x42c6], eax              
  02ee  c606c54200       mov byte ptr [0x42c5], 0                 
  02f3  803ef14104       cmp byte ptr [0x41f1], 4                 
  02f8  7403             je 0x2fd                                 
  02fa  e9af00           jmp 0x3ac                                
  02fd  b8042c           mov ax, 0x2c04                           
  0300  8ec0             mov es, ax                               
  0302  268b0e8101       mov cx, word ptr es:[0x181]              
  0307  e99600           jmp 0x3a0                                
  030a  8bd9             mov bx, cx                               
  030c  6bdb16           imul bx, bx, 0x16                        
  030f  b81d1e           mov ax, 0x1e1d                           
  0312  8ec0             mov es, ax                               
  0314  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0319  ba042c           mov dx, 0x2c04                           
  031c  8ec2             mov es, dx                               
  031e  263a061001       cmp al, byte ptr es:[0x110]              
  0323  747b             je 0x3a0                                 
  0325  8bd9             mov bx, cx                               
  0327  6bdb16           imul bx, bx, 0x16                        
  032a  b81d1e           mov ax, 0x1e1d                           
  032d  8ec0             mov es, ax                               
  032f  268b878088       mov ax, word ptr es:[bx - 0x7780]        
  0334  3b06e941         cmp ax, word ptr [0x41e9]                
  0338  7c66             jl 0x3a0                                 
  033a  8bd9             mov bx, cx                               
  033c  6bdb16           imul bx, bx, 0x16                        
  033f  b81d1e           mov ax, 0x1e1d                           
  0342  8b16e941         mov dx, word ptr [0x41e9]                
  0346  42               inc dx                                   
  0347  8ec0             mov es, ax                               
  0349  2639978088       cmp word ptr es:[bx - 0x7780], dx        
  034e  7f50             jg 0x3a0                                 
  0350  8bd9             mov bx, cx                               
  0352  6bdb16           imul bx, bx, 0x16                        
  0355  b81d1e           mov ax, 0x1e1d                           
  0358  8ec0             mov es, ax                               
  035a  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  035f  3b06e141         cmp ax, word ptr [0x41e1]                
  0363  7c3b             jl 0x3a0                                 
  0365  8bd9             mov bx, cx                               
  0367  6bdb16           imul bx, bx, 0x16                        
  036a  b81d1e           mov ax, 0x1e1d                           
  036d  8b16e141         mov dx, word ptr [0x41e1]                
  0371  42               inc dx                                   
  0372  8ec0             mov es, ax                               
  0374  2639978288       cmp word ptr es:[bx - 0x777e], dx        
  0379  7f25             jg 0x3a0                                 
  037b  a0c542           mov al, byte ptr [0x42c5]                
  037e  98               cwde                                     
  037f  c1e002           shl ax, 2                                
  0382  8bd1             mov dx, cx                               
  0384  6bd216           imul dx, dx, 0x16                        
  0387  bb0000           mov bx, 0                                
  038a  81c38088         add bx, 0x8880                           
  038e  03d3             add dx, bx                               
  0390  8bd8             mov bx, ax                               
  0392  c787e8421d1e     mov word ptr [bx + 0x42e8], 0x1e1d       
  0398  8997e642         mov word ptr [bx + 0x42e6], dx           
  039c  fe06c542         inc byte ptr [0x42c5]                    
  03a0  8bc1             mov ax, cx                               
  03a2  49               dec cx                                   
  03a3  0bc0             or ax, ax                                
  03a5  7403             je 0x3aa                                 
  03a7  e960ff           jmp 0x30a                                
  03aa  eb7d             jmp 0x429                                
  03ac  b8042c           mov ax, 0x2c04                           
  03af  8ec0             mov es, ax                               
  03b1  268b0e8101       mov cx, word ptr es:[0x181]              
  03b6  eb6a             jmp 0x422                                
  03b8  8bd9             mov bx, cx                               
  03ba  6bdb16           imul bx, bx, 0x16                        
  03bd  b81d1e           mov ax, 0x1e1d                           
  03c0  8ec0             mov es, ax                               
  03c2  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  03c7  ba042c           mov dx, 0x2c04                           
  03ca  8ec2             mov es, dx                               
  03cc  263a061001       cmp al, byte ptr es:[0x110]              
  03d1  744f             je 0x422                                 
  03d3  8bd9             mov bx, cx                               
  03d5  6bdb16           imul bx, bx, 0x16                        
  03d8  b81d1e           mov ax, 0x1e1d                           
  03db  8ec0             mov es, ax                               
  03dd  268b878088       mov ax, word ptr es:[bx - 0x7780]        
  03e2  3b06e941         cmp ax, word ptr [0x41e9]                
  03e6  753a             jne 0x422                                
  03e8  8bd9             mov bx, cx                               
  03ea  6bdb16           imul bx, bx, 0x16                        
  03ed  b81d1e           mov ax, 0x1e1d                           
  03f0  8ec0             mov es, ax                               
  03f2  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  03f7  3b06e141         cmp ax, word ptr [0x41e1]                
  03fb  7525             jne 0x422                                
  03fd  a0c542           mov al, byte ptr [0x42c5]                
  0400  98               cwde                                     
  0401  c1e002           shl ax, 2                                
  0404  8bd1             mov dx, cx                               
  0406  6bd216           imul dx, dx, 0x16                        
  0409  bb0000           mov bx, 0                                
  040c  81c38088         add bx, 0x8880                           
  0410  03d3             add dx, bx                               
  0412  8bd8             mov bx, ax                               
  0414  c787e8421d1e     mov word ptr [bx + 0x42e8], 0x1e1d       
  041a  8997e642         mov word ptr [bx + 0x42e6], dx           
  041e  fe06c542         inc byte ptr [0x42c5]                    
  0422  8bc1             mov ax, cx                               
  0424  49               dec cx                                   
  0425  0bc0             or ax, ax                                
  0427  758f             jne 0x3b8                                
  0429  33f6             xor si, si                               
  042b  eb06             jmp 0x433                                
  042d  c6842c4201       mov byte ptr [si + 0x422c], 1            
  0432  46               inc si                                   
  0433  a0c542           mov al, byte ptr [0x42c5]                
  0436  98               cwde                                     
  0437  3bc6             cmp ax, si                               
  0439  7ff2             jg 0x42d                                 
  043b  8b5e08           mov bx, word ptr [bp + 8]                
  043e  69dbe000         imul bx, bx, 0xe0                        
  0442  8b4606           mov ax, word ptr [bp + 6]                
  0445  d1e0             shl ax, 1                                
  0447  03d8             add bx, ax                               
  0449  b81d1e           mov ax, 0x1e1d                           
  044c  8ec0             mov es, ax                               
  044e  268a9f0000       mov bl, byte ptr es:[bx]                 
  0453  81e3ff00         and bx, 0xff                             
  0457  b8042c           mov ax, 0x2c04                           
  045a  8ec0             mov es, ax                               
  045c  2680bf100702     cmp byte ptr es:[bx + 0x710], 2          
  0462  7452             je 0x4b6                                 
  0464  8b5e08           mov bx, word ptr [bp + 8]                
  0467  69dbe000         imul bx, bx, 0xe0                        
  046b  8b4606           mov ax, word ptr [bp + 6]                
  046e  d1e0             shl ax, 1                                
  0470  03d8             add bx, ax                               
  0472  b81d1e           mov ax, 0x1e1d                           
  0475  8ec0             mov es, ax                               
  0477  268a9f0000       mov bl, byte ptr es:[bx]                 
  047c  81e3ff00         and bx, 0xff                             
  0480  b8042c           mov ax, 0x2c04                           
  0483  8ec0             mov es, ax                               
  0485  2680bf100703     cmp byte ptr es:[bx + 0x710], 3          
  048b  7429             je 0x4b6                                 
  048d  8b5e08           mov bx, word ptr [bp + 8]                
  0490  69dbe000         imul bx, bx, 0xe0                        
  0494  8b4606           mov ax, word ptr [bp + 6]                
  0497  d1e0             shl ax, 1                                
  0499  03d8             add bx, ax                               
  049b  b81d1e           mov ax, 0x1e1d                           
  049e  8ec0             mov es, ax                               
  04a0  268a9f0000       mov bl, byte ptr es:[bx]                 
  04a5  81e3ff00         and bx, 0xff                             
  04a9  b8042c           mov ax, 0x2c04                           
  04ac  8ec0             mov es, ax                               
  04ae  2680bf100706     cmp byte ptr es:[bx + 0x710], 6          
  04b4  7503             jne 0x4b9                                
  04b6  bf0100           mov di, 1                                
  04b9  33f6             xor si, si                               
  04bb  eb40             jmp 0x4fd                                
  04bd  8bde             mov bx, si                               
  04bf  c1e302           shl bx, 2                                
  04c2  c49fe642         les bx, ptr [bx + 0x42e6]                
  04c6  268a4704         mov al, byte ptr es:[bx + 4]             
  04ca  98               cwde                                     
  04cb  8b5ef6           mov bx, word ptr [bp - 0xa]              
  04ce  6bdb1d           imul bx, bx, 0x1d                        
  04d1  03d8             add bx, ax                               
  04d3  b8042c           mov ax, 0x2c04                           
  04d6  8ec0             mov es, ax                               
  04d8  268a870b06       mov al, byte ptr es:[bx + 0x60b]         
  04dd  888270ff         mov byte ptr [bp + si - 0x90], al        
  04e1  837eda00         cmp word ptr [bp - 0x26], 0              
  04e5  7515             jne 0x4fc                                
  04e7  8bde             mov bx, si                               
  04e9  c1e302           shl bx, 2                                
  04ec  c49fe642         les bx, ptr [bx + 0x42e6]                
  04f0  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  04f5  7505             jne 0x4fc                                
  04f7  c746da0100       mov word ptr [bp - 0x26], 1              
  04fc  46               inc si                                   
  04fd  a0c542           mov al, byte ptr [0x42c5]                
  0500  98               cwde                                     
  0501  3bc6             cmp ax, si                               
  0503  7fb8             jg 0x4bd                                 
  0505  33f6             xor si, si                               
  0507  eb42             jmp 0x54b                                
  0509  a0fa41           mov al, byte ptr [0x41fa]                
  050c  98               cwde                                     
  050d  6bc01d           imul ax, ax, 0x1d                        
  0510  8bde             mov bx, si                               
  0512  c1e302           shl bx, 2                                
  0515  c49fc642         les bx, ptr [bx + 0x42c6]                
  0519  50               push ax                                  
  051a  268a4704         mov al, byte ptr es:[bx + 4]             
  051e  98               cwde                                     
  051f  5b               pop bx                                   
  0520  03d8             add bx, ax                               
  0522  b8042c           mov ax, 0x2c04                           
  0525  8ec0             mov es, ax                               
  0527  268a870b06       mov al, byte ptr es:[bx + 0x60b]         
  052c  8842ce           mov byte ptr [bp + si - 0x32], al        
  052f  837ed800         cmp word ptr [bp - 0x28], 0              
  0533  7515             jne 0x54a                                
  0535  8bde             mov bx, si                               
  0537  c1e302           shl bx, 2                                
  053a  c49fc642         les bx, ptr [bx + 0x42c6]                
  053e  26807f041c       cmp byte ptr es:[bx + 4], 0x1c           
  0543  7505             jne 0x54a                                
  0545  c746d80100       mov word ptr [bp - 0x28], 1              
  054a  46               inc si                                   
  054b  a0c442           mov al, byte ptr [0x42c4]                
  054e  98               cwde                                     
  054f  3bc6             cmp ax, si                               
  0551  7fb6             jg 0x509                                 
  0553  33f6             xor si, si                               
  0555  eb44             jmp 0x59b                                
  0557  0bff             or di, di                                
  0559  743f             je 0x59a                                 
  055b  8bde             mov bx, si                               
  055d  c1e302           shl bx, 2                                
  0560  c49fe642         les bx, ptr [bx + 0x42e6]                
  0564  26f7470c0010     test word ptr es:[bx + 0xc], 0x1000      
  056a  752e             jne 0x59a                                
  056c  8bde             mov bx, si                               
  056e  c1e302           shl bx, 2                                
  0571  8b9fe642         mov bx, word ptr [bx + 0x42e6]           
  0575  268a4704         mov al, byte ptr es:[bx + 4]             
  0579  98               cwde                                     
  057a  6bc006           imul ax, ax, 6                           
  057d  8bd8             mov bx, ax                               
  057f  8a87c445         mov al, byte ptr [bx + 0x45c4]           
  0583  98               cwde                                     
  0584  0bc0             or ax, ax                                
  0586  7412             je 0x59a                                 
  0588  837eda00         cmp word ptr [bp - 0x26], 0              
  058c  740c             je 0x59a                                 
  058e  8a8270ff         mov al, byte ptr [bp + si - 0x90]        
  0592  0450             add al, 0x50                             
  0594  888270ff         mov byte ptr [bp + si - 0x90], al        
  0598  eb09             jmp 0x5a3                                
  059a  46               inc si                                   
  059b  a0c542           mov al, byte ptr [0x42c5]                
  059e  98               cwde                                     
  059f  3bc6             cmp ax, si                               
  05a1  7fb4             jg 0x557                                 
  05a3  33f6             xor si, si                               
  05a5  eb42             jmp 0x5e9                                
  05a7  0bff             or di, di                                
  05a9  743d             je 0x5e8                                 
  05ab  8bde             mov bx, si                               
  05ad  c1e302           shl bx, 2                                
  05b0  c49fc642         les bx, ptr [bx + 0x42c6]                
  05b4  26f7470c0010     test word ptr es:[bx + 0xc], 0x1000      
  05ba  752c             jne 0x5e8                                
  05bc  8bde             mov bx, si                               
  05be  c1e302           shl bx, 2                                
  05c1  8b9fc642         mov bx, word ptr [bx + 0x42c6]           
  05c5  268a4704         mov al, byte ptr es:[bx + 4]             
  05c9  98               cwde                                     
  05ca  6bc006           imul ax, ax, 6                           
  05cd  8bd8             mov bx, ax                               
  05cf  8a87c445         mov al, byte ptr [bx + 0x45c4]           
  05d3  98               cwde                                     
  05d4  0bc0             or ax, ax                                
  05d6  7410             je 0x5e8                                 
  05d8  837ed800         cmp word ptr [bp - 0x28], 0              
  05dc  740a             je 0x5e8                                 
  05de  8a42ce           mov al, byte ptr [bp + si - 0x32]        
  05e1  0450             add al, 0x50                             
  05e3  8842ce           mov byte ptr [bp + si - 0x32], al        
  05e6  eb09             jmp 0x5f1                                
  05e8  46               inc si                                   
  05e9  a0c442           mov al, byte ptr [0x42c4]                
  05ec  98               cwde                                     
  05ed  3bc6             cmp ax, si                               
  05ef  7fb6             jg 0x5a7                                 
  05f1  be0100           mov si, 1                                
  05f4  eb69             jmp 0x65f                                
  05f6  8a42ce           mov al, byte ptr [bp + si - 0x32]        
  05f9  3a42cd           cmp al, byte ptr [bp + si - 0x33]        
  05fc  7d60             jge 0x65e                                
  05fe  8bfe             mov di, si                               
  0600  eb50             jmp 0x652                                
  0602  8bdf             mov bx, di                               
  0604  c1e302           shl bx, 2                                
  0607  8b87c842         mov ax, word ptr [bx + 0x42c8]           
  060b  8b97c642         mov dx, word ptr [bx + 0x42c6]           
  060f  8946fe           mov word ptr [bp - 2], ax                
  0612  8956fc           mov word ptr [bp - 4], dx                
  0615  8bdf             mov bx, di                               
  0617  c1e302           shl bx, 2                                
  061a  8b87c442         mov ax, word ptr [bx + 0x42c4]           
  061e  8b97c242         mov dx, word ptr [bx + 0x42c2]           
  0622  8bdf             mov bx, di                               
  0624  c1e302           shl bx, 2                                
  0627  8987c842         mov word ptr [bx + 0x42c8], ax           
  062b  8997c642         mov word ptr [bx + 0x42c6], dx           
  062f  8bdf             mov bx, di                               
  0631  c1e302           shl bx, 2                                
  0634  8b46fe           mov ax, word ptr [bp - 2]                
  0637  8b56fc           mov dx, word ptr [bp - 4]                
  063a  8987c442         mov word ptr [bx + 0x42c4], ax           
  063e  8997c242         mov word ptr [bx + 0x42c2], dx           
  0642  8a43ce           mov al, byte ptr [bp + di - 0x32]        
  0645  98               cwde                                     
  0646  8bc8             mov cx, ax                               
  0648  8a43cd           mov al, byte ptr [bp + di - 0x33]        
  064b  8843ce           mov byte ptr [bp + di - 0x32], al        
  064e  884bcd           mov byte ptr [bp + di - 0x33], cl        
  0651  4f               dec di                                   
  0652  0bff             or di, di                                
  0654  7e08             jle 0x65e                                
  0656  8a43ce           mov al, byte ptr [bp + di - 0x32]        
  0659  3a43cd           cmp al, byte ptr [bp + di - 0x33]        
  065c  7ca4             jl 0x602                                 
  065e  46               inc si                                   
  065f  a0c442           mov al, byte ptr [0x42c4]                
  0662  98               cwde                                     
  0663  3bc6             cmp ax, si                               
  0665  7f8f             jg 0x5f6                                 
  0667  be0100           mov si, 1                                
  066a  eb71             jmp 0x6dd                                
  066c  8a8270ff         mov al, byte ptr [bp + si - 0x90]        
  0670  3a826fff         cmp al, byte ptr [bp + si - 0x91]        
  0674  7d66             jge 0x6dc                                
  0676  8bfe             mov di, si                               
  0678  eb54             jmp 0x6ce                                
  067a  8bdf             mov bx, di                               
  067c  c1e302           shl bx, 2                                
  067f  8b87e842         mov ax, word ptr [bx + 0x42e8]           
  0683  8b97e642         mov dx, word ptr [bx + 0x42e6]           
  0687  8946fe           mov word ptr [bp - 2], ax                
  068a  8956fc           mov word ptr [bp - 4], dx                
  068d  8bdf             mov bx, di                               
  068f  c1e302           shl bx, 2                                
  0692  8b87e442         mov ax, word ptr [bx + 0x42e4]           
  0696  8b97e242         mov dx, word ptr [bx + 0x42e2]           
  069a  8bdf             mov bx, di                               
  069c  c1e302           shl bx, 2                                
  069f  8987e842         mov word ptr [bx + 0x42e8], ax           
  06a3  8997e642         mov word ptr [bx + 0x42e6], dx           
  06a7  8bdf             mov bx, di                               
  06a9  c1e302           shl bx, 2                                
  06ac  8b46fe           mov ax, word ptr [bp - 2]                
  06af  8b56fc           mov dx, word ptr [bp - 4]                
  06b2  8987e442         mov word ptr [bx + 0x42e4], ax           
  06b6  8997e242         mov word ptr [bx + 0x42e2], dx           
  06ba  8a8370ff         mov al, byte ptr [bp + di - 0x90]        
  06be  98               cwde                                     
  06bf  8bc8             mov cx, ax                               
  06c1  8a836fff         mov al, byte ptr [bp + di - 0x91]        
  06c5  888370ff         mov byte ptr [bp + di - 0x90], al        
  06c9  888b6fff         mov byte ptr [bp + di - 0x91], cl        
  06cd  4f               dec di                                   
  06ce  0bff             or di, di                                
  06d0  7e0a             jle 0x6dc                                
  06d2  8a8370ff         mov al, byte ptr [bp + di - 0x90]        
  06d6  3a836fff         cmp al, byte ptr [bp + di - 0x91]        
  06da  7c9e             jl 0x67a                                 
  06dc  46               inc si                                   
  06dd  a0c542           mov al, byte ptr [0x42c5]                
  06e0  98               cwde                                     
  06e1  3bc6             cmp ax, si                               
  06e3  7f87             jg 0x66c                                 
  06e5  a0c442           mov al, byte ptr [0x42c4]                
  06e8  98               cwde                                     
  06e9  8bf0             mov si, ax                               
  06eb  eb16             jmp 0x703                                
  06ed  c684744201       mov byte ptr [si + 0x4274], 1            
  06f2  8bde             mov bx, si                               
  06f4  c1e302           shl bx, 2                                
  06f7  c49fc642         les bx, ptr [bx + 0x42c6]                
  06fb  268a4704         mov al, byte ptr es:[bx + 4]             
  06ff  88844c42         mov byte ptr [si + 0x424c], al           
  0703  8bc6             mov ax, si                               
  0705  4e               dec si                                   
  0706  0bc0             or ax, ax                                
  0708  75e3             jne 0x6ed                                
  070a  a0c542           mov al, byte ptr [0x42c5]                
  070d  98               cwde                                     
  070e  8bf0             mov si, ax                               
  0710  eb16             jmp 0x728                                
  0712  c6847c4201       mov byte ptr [si + 0x427c], 1            
  0717  8bde             mov bx, si                               
  0719  c1e302           shl bx, 2                                
  071c  c49fe642         les bx, ptr [bx + 0x42e6]                
  0720  268a4704         mov al, byte ptr es:[bx + 4]             
  0724  88845442         mov byte ptr [si + 0x4254], al           
  0728  8bc6             mov ax, si                               
  072a  4e               dec si                                   
  072b  0bc0             or ax, ax                                
  072d  75e3             jne 0x712                                
  072f  33c0             xor ax, ax                               
  0731  8946f2           mov word ptr [bp - 0xe], ax              
  0734  8bf8             mov di, ax                               
  0736  33f6             xor si, si                               
  0738  e91601           jmp 0x851                                
  073b  16               push ss                                  
  073c  8d4690           lea ax, [bp - 0x70]                      
  073f  50               push ax                                  
  0740  8a844c42         mov al, byte ptr [si + 0x424c]           
  0744  98               cwde                                     
  0745  50               push ax                                  
  0746  9a84005830       lcall 0x3058, 0x84                       -> ovl44:14ac
  074b  83c406           add sp, 6                                
  074e  80bc4c421c       cmp byte ptr [si + 0x424c], 0x1c         
  0753  7538             jne 0x78d                                
  0755  8bde             mov bx, si                               
  0757  c1e302           shl bx, 2                                
  075a  c49fc642         les bx, ptr [bx + 0x42c6]                
  075e  268a4708         mov al, byte ptr es:[bx + 8]             
  0762  98               cwde                                     
  0763  50               push ax                                  
  0764  8bde             mov bx, si                               
  0766  c1e302           shl bx, 2                                
  0769  66ffb7c642       push dword ptr [bx + 0x42c6]             
  076e  90               nop                                      
  076f  0e               push cs                                  
  0770  e8a705           call 0xd1a                               
  0773  83c404           add sp, 4                                
  0776  5a               pop dx                                   
  0777  03d0             add dx, ax                               
  0779  8bca             mov cx, dx                               
  077b  3bcf             cmp cx, di                               
  077d  7e0e             jle 0x78d                                
  077f  83f909           cmp cx, 9                                
  0782  7e05             jle 0x789                                
  0784  b80900           mov ax, 9                                
  0787  eb02             jmp 0x78b                                
  0789  8bc1             mov ax, cx                               
  078b  8bf8             mov di, ax                               
  078d  837ec401         cmp word ptr [bp - 0x3c], 1              
  0791  7505             jne 0x798                                
  0793  c746e40100       mov word ptr [bp - 0x1c], 1              
  0798  837ec402         cmp word ptr [bp - 0x3c], 2              
  079c  7505             jne 0x7a3                                
  079e  c746e20100       mov word ptr [bp - 0x1e], 1              
  07a3  837ec403         cmp word ptr [bp - 0x3c], 3              
  07a7  7505             jne 0x7ae                                
  07a9  c746e00100       mov word ptr [bp - 0x20], 1              
  07ae  837ec200         cmp word ptr [bp - 0x3e], 0              
  07b2  7410             je 0x7c4                                 
  07b4  8b46e8           mov ax, word ptr [bp - 0x18]             
  07b7  3b46c2           cmp ax, word ptr [bp - 0x3e]             
  07ba  7d02             jge 0x7be                                
  07bc  eb03             jmp 0x7c1                                
  07be  8b46c2           mov ax, word ptr [bp - 0x3e]             
  07c1  8946e8           mov word ptr [bp - 0x18], ax             
  07c4  837ed600         cmp word ptr [bp - 0x2a], 0              
  07c8  7516             jne 0x7e0                                
  07ca  837eb800         cmp word ptr [bp - 0x48], 0              
  07ce  7410             je 0x7e0                                 
  07d0  8b46f0           mov ax, word ptr [bp - 0x10]             
  07d3  3b46b8           cmp ax, word ptr [bp - 0x48]             
  07d6  7e02             jle 0x7da                                
  07d8  eb03             jmp 0x7dd                                
  07da  8b46b8           mov ax, word ptr [bp - 0x48]             
  07dd  8946f0           mov word ptr [bp - 0x10], ax             
  07e0  837ed601         cmp word ptr [bp - 0x2a], 1              
  07e4  7516             jne 0x7fc                                
  07e6  837eba00         cmp word ptr [bp - 0x46], 0              
  07ea  7410             je 0x7fc                                 
  07ec  8b46f0           mov ax, word ptr [bp - 0x10]             
  07ef  3b46ba           cmp ax, word ptr [bp - 0x46]             
  07f2  7e02             jle 0x7f6                                
  07f4  eb03             jmp 0x7f9                                
  07f6  8b46ba           mov ax, word ptr [bp - 0x46]             
  07f9  8946f0           mov word ptr [bp - 0x10], ax             
  07fc  837ed602         cmp word ptr [bp - 0x2a], 2              
  0800  7516             jne 0x818                                
  0802  837ebc00         cmp word ptr [bp - 0x44], 0              
  0806  7410             je 0x818                                 
  0808  8b46f0           mov ax, word ptr [bp - 0x10]             
  080b  3b46bc           cmp ax, word ptr [bp - 0x44]             
  080e  7e02             jle 0x812                                
  0810  eb03             jmp 0x815                                
  0812  8b46bc           mov ax, word ptr [bp - 0x44]             
  0815  8946f0           mov word ptr [bp - 0x10], ax             
  0818  837ed603         cmp word ptr [bp - 0x2a], 3              
  081c  7516             jne 0x834                                
  081e  837ebe00         cmp word ptr [bp - 0x42], 0              
  0822  7410             je 0x834                                 
  0824  8b46f0           mov ax, word ptr [bp - 0x10]             
  0827  3b46be           cmp ax, word ptr [bp - 0x42]             
  082a  7e02             jle 0x82e                                
  082c  eb03             jmp 0x831                                
  082e  8b46be           mov ax, word ptr [bp - 0x42]             
  0831  8946f0           mov word ptr [bp - 0x10], ax             
  0834  80bc4c421c       cmp byte ptr [si + 0x424c], 0x1c         
  0839  7515             jne 0x850                                
  083b  8bde             mov bx, si                               
  083d  c1e302           shl bx, 2                                
  0840  66ffb7c642       push dword ptr [bx + 0x42c6]             
  0845  90               nop                                      
  0846  0e               push cs                                  
  0847  e82705           call 0xd71                               
  084a  83c404           add sp, 4                                
  084d  0146f2           add word ptr [bp - 0xe], ax              
  0850  46               inc si                                   
  0851  a0c442           mov al, byte ptr [0x42c4]                
  0854  98               cwde                                     
  0855  3bc6             cmp ax, si                               
  0857  7e03             jle 0x85c                                
  0859  e9dffe           jmp 0x73b                                
  085c  8bdf             mov bx, di                               
  085e  d1e3             shl bx, 1                                
  0860  8b46f2           mov ax, word ptr [bp - 0xe]              
  0863  0387e40c         add ax, word ptr [bx + 0xce4]            
  0867  8946ec           mov word ptr [bp - 0x14], ax             
  086a  33c0             xor ax, ax                               
  086c  8946f2           mov word ptr [bp - 0xe], ax              
  086f  8bf8             mov di, ax                               
  0871  33f6             xor si, si                               
  0873  e90b01           jmp 0x981                                
  0876  16               push ss                                  
  0877  8d4690           lea ax, [bp - 0x70]                      
  087a  50               push ax                                  
  087b  8a845442         mov al, byte ptr [si + 0x4254]           
  087f  98               cwde                                     
  0880  50               push ax                                  
  0881  9a84005830       lcall 0x3058, 0x84                       -> ovl44:14ac
  0886  83c406           add sp, 6                                
  0889  80bc54421c       cmp byte ptr [si + 0x4254], 0x1c         
  088e  7538             jne 0x8c8                                
  0890  8bde             mov bx, si                               
  0892  c1e302           shl bx, 2                                
  0895  c49fe642         les bx, ptr [bx + 0x42e6]                
  0899  268a4708         mov al, byte ptr es:[bx + 8]             
  089d  98               cwde                                     
  089e  50               push ax                                  
  089f  8bde             mov bx, si                               
  08a1  c1e302           shl bx, 2                                
  08a4  66ffb7e642       push dword ptr [bx + 0x42e6]             
  08a9  90               nop                                      
  08aa  0e               push cs                                  
  08ab  e86c04           call 0xd1a                               
  08ae  83c404           add sp, 4                                
  08b1  5a               pop dx                                   
  08b2  03d0             add dx, ax                               
  08b4  8bca             mov cx, dx                               
  08b6  3bcf             cmp cx, di                               
  08b8  7e0e             jle 0x8c8                                
  08ba  83f909           cmp cx, 9                                
  08bd  7e05             jle 0x8c4                                
  08bf  b80900           mov ax, 9                                
  08c2  eb02             jmp 0x8c6                                
  08c4  8bc1             mov ax, cx                               
  08c6  8bf8             mov di, ax                               
  08c8  837ec402         cmp word ptr [bp - 0x3c], 2              
  08cc  7505             jne 0x8d3                                
  08ce  c746de0100       mov word ptr [bp - 0x22], 1              
  08d3  837ec403         cmp word ptr [bp - 0x3c], 3              
  08d7  7505             jne 0x8de                                
  08d9  c746dc0100       mov word ptr [bp - 0x24], 1              
  08de  837ec200         cmp word ptr [bp - 0x3e], 0              
  08e2  7410             je 0x8f4                                 
  08e4  8b46ee           mov ax, word ptr [bp - 0x12]             
  08e7  3b46c2           cmp ax, word ptr [bp - 0x3e]             
  08ea  7d02             jge 0x8ee                                
  08ec  eb03             jmp 0x8f1                                
  08ee  8b46c2           mov ax, word ptr [bp - 0x3e]             
  08f1  8946ee           mov word ptr [bp - 0x12], ax             
  08f4  837ed600         cmp word ptr [bp - 0x2a], 0              
  08f8  7516             jne 0x910                                
  08fa  837eb800         cmp word ptr [bp - 0x48], 0              
  08fe  7410             je 0x910                                 
  0900  8b46ea           mov ax, word ptr [bp - 0x16]             
  0903  3b46b8           cmp ax, word ptr [bp - 0x48]             
  0906  7e02             jle 0x90a                                
  0908  eb03             jmp 0x90d                                
  090a  8b46b8           mov ax, word ptr [bp - 0x48]             
  090d  8946ea           mov word ptr [bp - 0x16], ax             
  0910  837ed601         cmp word ptr [bp - 0x2a], 1              
  0914  7516             jne 0x92c                                
  0916  837eba00         cmp word ptr [bp - 0x46], 0              
  091a  7410             je 0x92c                                 
  091c  8b46ea           mov ax, word ptr [bp - 0x16]             
  091f  3b46ba           cmp ax, word ptr [bp - 0x46]             
  0922  7e02             jle 0x926                                
  0924  eb03             jmp 0x929                                
  0926  8b46ba           mov ax, word ptr [bp - 0x46]             
  0929  8946ea           mov word ptr [bp - 0x16], ax             
  092c  837ed602         cmp word ptr [bp - 0x2a], 2              
  0930  7516             jne 0x948                                
  0932  837ebc00         cmp word ptr [bp - 0x44], 0              
  0936  7410             je 0x948                                 
  0938  8b46ea           mov ax, word ptr [bp - 0x16]             
  093b  3b46bc           cmp ax, word ptr [bp - 0x44]             
  093e  7e02             jle 0x942                                
  0940  eb03             jmp 0x945                                
  0942  8b46bc           mov ax, word ptr [bp - 0x44]             
  0945  8946ea           mov word ptr [bp - 0x16], ax             
  0948  837ed603         cmp word ptr [bp - 0x2a], 3              
  094c  7516             jne 0x964                                
  094e  837ebe00         cmp word ptr [bp - 0x42], 0              
  0952  7410             je 0x964                                 
  0954  8b46ea           mov ax, word ptr [bp - 0x16]             
  0957  3b46be           cmp ax, word ptr [bp - 0x42]             
  095a  7e02             jle 0x95e                                
  095c  eb03             jmp 0x961                                
  095e  8b46be           mov ax, word ptr [bp - 0x42]             
  0961  8946ea           mov word ptr [bp - 0x16], ax             
  0964  80bc54421c       cmp byte ptr [si + 0x4254], 0x1c         
  0969  7515             jne 0x980                                
  096b  8bde             mov bx, si                               
  096d  c1e302           shl bx, 2                                
  0970  66ffb7e642       push dword ptr [bx + 0x42e6]             
  0975  90               nop                                      
  0976  0e               push cs                                  
  0977  e8f703           call 0xd71                               
  097a  83c404           add sp, 4                                
  097d  0146f2           add word ptr [bp - 0xe], ax              
  0980  46               inc si                                   
  0981  a0c542           mov al, byte ptr [0x42c5]                
  0984  98               cwde                                     
  0985  3bc6             cmp ax, si                               
  0987  7e03             jle 0x98c                                
  0989  e9eafe           jmp 0x876                                
  098c  837ee400         cmp word ptr [bp - 0x1c], 0              
  0990  7568             jne 0x9fa                                
  0992  837ed600         cmp word ptr [bp - 0x2a], 0              
  0996  7562             jne 0x9fa                                
  0998  a0f341           mov al, byte ptr [0x41f3]                
  099b  c1e805           shr ax, 5                                
  099e  250100           and ax, 1                                
  09a1  0bc0             or ax, ax                                
  09a3  7407             je 0x9ac                                 
  09a5  c746f40100       mov word ptr [bp - 0xc], 1               
  09aa  eb3c             jmp 0x9e8                                
  09ac  8b5e08           mov bx, word ptr [bp + 8]                
  09af  69dbe000         imul bx, bx, 0xe0                        
  09b3  8b4606           mov ax, word ptr [bp + 6]                
  09b6  d1e0             shl ax, 1                                
  09b8  03d8             add bx, ax                               
  09ba  b81d1e           mov ax, 0x1e1d                           
  09bd  8ec0             mov es, ax                               
  09bf  268a9f0000       mov bl, byte ptr es:[bx]                 
  09c4  81e3ff00         and bx, 0xff                             
  09c8  b8042c           mov ax, 0x2c04                           
  09cb  8ec0             mov es, ax                               
  09cd  2680bf10070b     cmp byte ptr es:[bx + 0x710], 0xb        
  09d3  7507             jne 0x9dc                                
  09d5  c746f40200       mov word ptr [bp - 0xc], 2               
  09da  eb0c             jmp 0x9e8                                
  09dc  c41edd41         les bx, ptr [0x41dd]                     
  09e0  268a4714         mov al, byte ptr es:[bx + 0x14]          
  09e4  98               cwde                                     
  09e5  8946f4           mov word ptr [bp - 0xc], ax              
  09e8  803efb410f       cmp byte ptr [0x41fb], 0xf               
  09ed  750b             jne 0x9fa                                
  09ef  8b46f4           mov ax, word ptr [bp - 0xc]              
  09f2  99               cdq                                      
  09f3  2bc2             sub ax, dx                               
  09f5  d1f8             sar ax, 1                                
  09f7  8946f4           mov word ptr [bp - 0xc], ax              
  09fa  8bdf             mov bx, di                               
  09fc  d1e3             shl bx, 1                                
  09fe  8b46f2           mov ax, word ptr [bp - 0xe]              
  0a01  0387e40c         add ax, word ptr [bx + 0xce4]            
  0a05  8946e6           mov word ptr [bp - 0x1a], ax             
  0a08  c746fa0000       mov word ptr [bp - 6], 0                 
  0a0d  837ede00         cmp word ptr [bp - 0x22], 0              
  0a11  7506             jne 0xa19                                
  0a13  8b46ec           mov ax, word ptr [bp - 0x14]             
  0a16  0146fa           add word ptr [bp - 6], ax                
  0a19  837edc00         cmp word ptr [bp - 0x24], 0              
  0a1d  7506             jne 0xa25                                
  0a1f  8b46f0           mov ax, word ptr [bp - 0x10]             
  0a22  0146fa           add word ptr [bp - 6], ax                
  0a25  b8042c           mov ax, 0x2c04                           
  0a28  8ec0             mov es, ax                               
  0a2a  26a11201         mov ax, word ptr es:[0x112]              
  0a2e  3b46fa           cmp ax, word ptr [bp - 6]                
  0a31  7d0b             jge 0xa3e                                
  0a33  b8042c           mov ax, 0x2c04                           
  0a36  8ec0             mov es, ax                               
  0a38  26a11201         mov ax, word ptr es:[0x112]              
  0a3c  eb03             jmp 0xa41                                
  0a3e  8b46fa           mov ax, word ptr [bp - 6]                
  0a41  8946fa           mov word ptr [bp - 6], ax                
  0a44  8b46ee           mov ax, word ptr [bp - 0x12]             
  0a47  0146fa           add word ptr [bp - 6], ax                
  0a4a  c746f80000       mov word ptr [bp - 8], 0                 
  0a4f  837ee200         cmp word ptr [bp - 0x1e], 0              
  0a53  7506             jne 0xa5b                                
  0a55  8b46e6           mov ax, word ptr [bp - 0x1a]             
  0a58  0146f8           add word ptr [bp - 8], ax                
  0a5b  837ee000         cmp word ptr [bp - 0x20], 0              
  0a5f  7506             jne 0xa67                                
  0a61  8b46ea           mov ax, word ptr [bp - 0x16]             
  0a64  0146f8           add word ptr [bp - 8], ax                
  0a67  837ee400         cmp word ptr [bp - 0x1c], 0              
  0a6b  7506             jne 0xa73                                
  0a6d  8b46f4           mov ax, word ptr [bp - 0xc]              
  0a70  0146f8           add word ptr [bp - 8], ax                
  0a73  b8042c           mov ax, 0x2c04                           
  0a76  8ec0             mov es, ax                               
  0a78  26a11201         mov ax, word ptr es:[0x112]              
  0a7c  3b46f8           cmp ax, word ptr [bp - 8]                
  0a7f  7d0b             jge 0xa8c                                
  0a81  b8042c           mov ax, 0x2c04                           
  0a84  8ec0             mov es, ax                               
  0a86  26a11201         mov ax, word ptr es:[0x112]              
  0a8a  eb03             jmp 0xa8f                                
  0a8c  8b46f8           mov ax, word ptr [bp - 8]                
  0a8f  8946f8           mov word ptr [bp - 8], ax                
  0a92  8b46e8           mov ax, word ptr [bp - 0x18]             
  0a95  0146f8           add word ptr [bp - 8], ax                
  0a98  33f6             xor si, si                               
  0a9a  e92f01           jmp 0xbcc                                
  0a9d  16               push ss                                  
  0a9e  8d4690           lea ax, [bp - 0x70]                      
  0aa1  50               push ax                                  
  0aa2  8a844c42         mov al, byte ptr [si + 0x424c]           
  0aa6  98               cwde                                     
  0aa7  50               push ax                                  
  0aa8  9a84005830       lcall 0x3058, 0x84                       -> ovl44:14ac
  0aad  83c406           add sp, 6                                
  0ab0  c684fc4100       mov byte ptr [si + 0x41fc], 0            
  0ab5  8bde             mov bx, si                               
  0ab7  c1e302           shl bx, 2                                
  0aba  c49fc642         les bx, ptr [bx + 0x42c6]                
  0abe  26f7470c0010     test word ptr es:[bx + 0xc], 0x1000      
  0ac4  745f             je 0xb25                                 
  0ac6  8b5e08           mov bx, word ptr [bp + 8]                
  0ac9  69dbe000         imul bx, bx, 0xe0                        
  0acd  8b4606           mov ax, word ptr [bp + 6]                
  0ad0  d1e0             shl ax, 1                                
  0ad2  03d8             add bx, ax                               
  0ad4  b81d1e           mov ax, 0x1e1d                           
  0ad7  8ec0             mov es, ax                               
  0ad9  268a9f0000       mov bl, byte ptr es:[bx]                 
  0ade  81e3ff00         and bx, 0xff                             
  0ae2  b8042c           mov ax, 0x2c04                           
  0ae5  8ec0             mov es, ax                               
  0ae7  2680bf100702     cmp byte ptr es:[bx + 0x710], 2          
  0aed  7429             je 0xb18                                 
  0aef  8b5e08           mov bx, word ptr [bp + 8]                
  0af2  69dbe000         imul bx, bx, 0xe0                        
  0af6  8b4606           mov ax, word ptr [bp + 6]                
  0af9  d1e0             shl ax, 1                                
  0afb  03d8             add bx, ax                               
  0afd  b81d1e           mov ax, 0x1e1d                           
  0b00  8ec0             mov es, ax                               
  0b02  268a9f0000       mov bl, byte ptr es:[bx]                 
  0b07  81e3ff00         and bx, 0xff                             
  0b0b  b8042c           mov ax, 0x2c04                           
  0b0e  8ec0             mov es, ax                               
  0b10  2680bf100703     cmp byte ptr es:[bx + 0x710], 3          
  0b16  750d             jne 0xb25                                
  0b18  c6849c4204       mov byte ptr [si + 0x429c], 4            
  0b1d  c684fc4101       mov byte ptr [si + 0x41fc], 1            
  0b22  e9a600           jmp 0xbcb                                
  0b25  8bde             mov bx, si                               
  0b27  c1e302           shl bx, 2                                
  0b2a  c49fc642         les bx, ptr [bx + 0x42c6]                
  0b2e  268a4708         mov al, byte ptr es:[bx + 8]             
  0b32  0246fa           add al, byte ptr [bp - 6]                
  0b35  88849c42         mov byte ptr [si + 0x429c], al           
  0b39  80bc4c421c       cmp byte ptr [si + 0x424c], 0x1c         
  0b3e  751c             jne 0xb5c                                
  0b40  8bde             mov bx, si                               
  0b42  c1e302           shl bx, 2                                
  0b45  66ffb7c642       push dword ptr [bx + 0x42c6]             
  0b4a  90               nop                                      
  0b4b  0e               push cs                                  
  0b4c  e8cb01           call 0xd1a                               
  0b4f  83c404           add sp, 4                                
  0b52  8a949c42         mov dl, byte ptr [si + 0x429c]           
  0b56  02d0             add dl, al                               
  0b58  88949c42         mov byte ptr [si + 0x429c], dl           
  0b5c  837ed600         cmp word ptr [bp - 0x2a], 0              
  0b60  7511             jne 0xb73                                
  0b62  837eb000         cmp word ptr [bp - 0x50], 0              
  0b66  740b             je 0xb73                                 
  0b68  8a849c42         mov al, byte ptr [si + 0x429c]           
  0b6c  0246b0           add al, byte ptr [bp - 0x50]             
  0b6f  88849c42         mov byte ptr [si + 0x429c], al           
  0b73  837ed601         cmp word ptr [bp - 0x2a], 1              
  0b77  7511             jne 0xb8a                                
  0b79  837eb200         cmp word ptr [bp - 0x4e], 0              
  0b7d  740b             je 0xb8a                                 
  0b7f  8a849c42         mov al, byte ptr [si + 0x429c]           
  0b83  0246b2           add al, byte ptr [bp - 0x4e]             
  0b86  88849c42         mov byte ptr [si + 0x429c], al           
  0b8a  837ed602         cmp word ptr [bp - 0x2a], 2              
  0b8e  7511             jne 0xba1                                
  0b90  837eb400         cmp word ptr [bp - 0x4c], 0              
  0b94  740b             je 0xba1                                 
  0b96  8a849c42         mov al, byte ptr [si + 0x429c]           
  0b9a  0246b4           add al, byte ptr [bp - 0x4c]             
  0b9d  88849c42         mov byte ptr [si + 0x429c], al           
  0ba1  837ed603         cmp word ptr [bp - 0x2a], 3              
  0ba5  7511             jne 0xbb8                                
  0ba7  837eb600         cmp word ptr [bp - 0x4a], 0              
  0bab  740b             je 0xbb8                                 
  0bad  8a849c42         mov al, byte ptr [si + 0x429c]           
  0bb1  0246b6           add al, byte ptr [bp - 0x4a]             
  0bb4  88849c42         mov byte ptr [si + 0x429c], al           
  0bb8  80bc9c420f       cmp byte ptr [si + 0x429c], 0xf          
  0bbd  7e04             jle 0xbc3                                
  0bbf  b00f             mov al, 0xf                              
  0bc1  eb04             jmp 0xbc7                                
  0bc3  8a849c42         mov al, byte ptr [si + 0x429c]           
  0bc7  88849c42         mov byte ptr [si + 0x429c], al           
  0bcb  46               inc si                                   
  0bcc  a0c442           mov al, byte ptr [0x42c4]                
  0bcf  98               cwde                                     
  0bd0  3bc6             cmp ax, si                               
  0bd2  7e03             jle 0xbd7                                
  0bd4  e9c6fe           jmp 0xa9d                                
  0bd7  33f6             xor si, si                               
  0bd9  e92f01           jmp 0xd0b                                
  0bdc  16               push ss                                  
  0bdd  8d4690           lea ax, [bp - 0x70]                      
  0be0  50               push ax                                  
  0be1  8a845442         mov al, byte ptr [si + 0x4254]           
  0be5  98               cwde                                     
  0be6  50               push ax                                  
  0be7  9a84005830       lcall 0x3058, 0x84                       -> ovl44:14ac
  0bec  83c406           add sp, 6                                
  0bef  c684044200       mov byte ptr [si + 0x4204], 0            
  0bf4  8bde             mov bx, si                               
  0bf6  c1e302           shl bx, 2                                
  0bf9  c49fe642         les bx, ptr [bx + 0x42e6]                
  0bfd  26f7470c0010     test word ptr es:[bx + 0xc], 0x1000      
  0c03  745f             je 0xc64                                 
  0c05  8b5e08           mov bx, word ptr [bp + 8]                
  0c08  69dbe000         imul bx, bx, 0xe0                        
  0c0c  8b4606           mov ax, word ptr [bp + 6]                
  0c0f  d1e0             shl ax, 1                                
  0c11  03d8             add bx, ax                               
  0c13  b81d1e           mov ax, 0x1e1d                           
  0c16  8ec0             mov es, ax                               
  0c18  268a9f0000       mov bl, byte ptr es:[bx]                 
  0c1d  81e3ff00         and bx, 0xff                             
  0c21  b8042c           mov ax, 0x2c04                           
  0c24  8ec0             mov es, ax                               
  0c26  2680bf100702     cmp byte ptr es:[bx + 0x710], 2          
  0c2c  7429             je 0xc57                                 
  0c2e  8b5e08           mov bx, word ptr [bp + 8]                
  0c31  69dbe000         imul bx, bx, 0xe0                        
  0c35  8b4606           mov ax, word ptr [bp + 6]                
  0c38  d1e0             shl ax, 1                                
  0c3a  03d8             add bx, ax                               
  0c3c  b81d1e           mov ax, 0x1e1d                           
  0c3f  8ec0             mov es, ax                               
  0c41  268a9f0000       mov bl, byte ptr es:[bx]                 
  0c46  81e3ff00         and bx, 0xff                             
  0c4a  b8042c           mov ax, 0x2c04                           
  0c4d  8ec0             mov es, ax                               
  0c4f  2680bf100703     cmp byte ptr es:[bx + 0x710], 3          
  0c55  750d             jne 0xc64                                
  0c57  c684a44204       mov byte ptr [si + 0x42a4], 4            
  0c5c  c684044201       mov byte ptr [si + 0x4204], 1            
  0c61  e9a600           jmp 0xd0a                                
  0c64  8bde             mov bx, si                               
  0c66  c1e302           shl bx, 2                                
  0c69  c49fe642         les bx, ptr [bx + 0x42e6]                
  0c6d  268a4708         mov al, byte ptr es:[bx + 8]             
  0c71  0246f8           add al, byte ptr [bp - 8]                
  0c74  8884a442         mov byte ptr [si + 0x42a4], al           
  0c78  80bc54421c       cmp byte ptr [si + 0x4254], 0x1c         
  0c7d  751c             jne 0xc9b                                
  0c7f  8bde             mov bx, si                               
  0c81  c1e302           shl bx, 2                                
  0c84  66ffb7e642       push dword ptr [bx + 0x42e6]             
  0c89  90               nop                                      
  0c8a  0e               push cs                                  
  0c8b  e88c00           call 0xd1a                               
  0c8e  83c404           add sp, 4                                
  0c91  8a94a442         mov dl, byte ptr [si + 0x42a4]           
  0c95  02d0             add dl, al                               
  0c97  8894a442         mov byte ptr [si + 0x42a4], dl           
  0c9b  837ed600         cmp word ptr [bp - 0x2a], 0              
  0c9f  7511             jne 0xcb2                                
  0ca1  837eb000         cmp word ptr [bp - 0x50], 0              
  0ca5  740b             je 0xcb2                                 
  0ca7  8a84a442         mov al, byte ptr [si + 0x42a4]           
  0cab  0246b0           add al, byte ptr [bp - 0x50]             
  0cae  8884a442         mov byte ptr [si + 0x42a4], al           
  0cb2  837ed601         cmp word ptr [bp - 0x2a], 1              
  0cb6  7511             jne 0xcc9                                
  0cb8  837eb200         cmp word ptr [bp - 0x4e], 0              
  0cbc  740b             je 0xcc9                                 
  0cbe  8a84a442         mov al, byte ptr [si + 0x42a4]           
  0cc2  0246b2           add al, byte ptr [bp - 0x4e]             
  0cc5  8884a442         mov byte ptr [si + 0x42a4], al           
  0cc9  837ed602         cmp word ptr [bp - 0x2a], 2              
  0ccd  7511             jne 0xce0                                
  0ccf  837eb400         cmp word ptr [bp - 0x4c], 0              
  0cd3  740b             je 0xce0                                 
  0cd5  8a84a442         mov al, byte ptr [si + 0x42a4]           
  0cd9  0246b4           add al, byte ptr [bp - 0x4c]             
  0cdc  8884a442         mov byte ptr [si + 0x42a4], al           
  0ce0  837ed603         cmp word ptr [bp - 0x2a], 3              
  0ce4  7511             jne 0xcf7                                
  0ce6  837eb600         cmp word ptr [bp - 0x4a], 0              
  0cea  740b             je 0xcf7                                 
  0cec  8a84a442         mov al, byte ptr [si + 0x42a4]           
  0cf0  0246b6           add al, byte ptr [bp - 0x4a]             
  0cf3  8884a442         mov byte ptr [si + 0x42a4], al           
  0cf7  80bca4420f       cmp byte ptr [si + 0x42a4], 0xf          
  0cfc  7e04             jle 0xd02                                
  0cfe  b00f             mov al, 0xf                              
  0d00  eb04             jmp 0xd06                                
  0d02  8a84a442         mov al, byte ptr [si + 0x42a4]           
  0d06  8884a442         mov byte ptr [si + 0x42a4], al           
  0d0a  46               inc si                                   
  0d0b  a0c542           mov al, byte ptr [0x42c5]                
  0d0e  98               cwde                                     
  0d0f  3bc6             cmp ax, si                               
  0d11  7e03             jle 0xd16                                
  0d13  e9c6fe           jmp 0xbdc                                
  0d16  5f               pop di                                   
  0d17  5e               pop si                                   
  0d18  c9               leave                                    
  0d19  cb               retf                                     

ovl38_0d1a:  ; ENTRY
  0d1a  55               push bp                                  
  0d1b  8bec             mov bp, sp                               
  0d1d  56               push si                                  
  0d1e  33f6             xor si, si                               
  0d20  66ff7606         push dword ptr [bp + 6]                  
  0d24  666a00           push 0                                   
  0d27  6a02             push 2                                   
  0d29  9a48009030       lcall 0x3090, 0x48                       -> ovl51:03d9
  0d2e  83c40a           add sp, 0xa                              
  0d31  33d2             xor dx, dx                               
  0d33  eb31             jmp 0xd66                                
  0d35  8bda             mov bx, dx                               
  0d37  d1e3             shl bx, 1                                
  0d39  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  0d3d  6bdb1d           imul bx, bx, 0x1d                        
  0d40  b8042c           mov ax, 0x2c04                           
  0d43  8ec0             mov es, ax                               
  0d45  2680bffd0c01     cmp byte ptr es:[bx + 0xcfd], 1          
  0d4b  7518             jne 0xd65                                
  0d4d  8bda             mov bx, dx                               
  0d4f  d1e3             shl bx, 1                                
  0d51  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  0d55  6bdb1d           imul bx, bx, 0x1d                        
  0d58  b8042c           mov ax, 0x2c04                           
  0d5b  8ec0             mov es, ax                               
  0d5d  268a87fe0c       mov al, byte ptr es:[bx + 0xcfe]         
  0d62  98               cwde                                     
  0d63  03f0             add si, ax                               
  0d65  42               inc dx                                   
  0d66  3b162e48         cmp dx, word ptr [0x482e]                
  0d6a  7cc9             jl 0xd35                                 
  0d6c  8bc6             mov ax, si                               
  0d6e  5e               pop si                                   
  0d6f  5d               pop bp                                   
  0d70  cb               retf                                     

ovl38_0d71:  ; ENTRY
  0d71  55               push bp                                  
  0d72  8bec             mov bp, sp                               
  0d74  56               push si                                  
  0d75  33f6             xor si, si                               
  0d77  66ff7606         push dword ptr [bp + 6]                  
  0d7b  666a00           push 0                                   
  0d7e  6a02             push 2                                   
  0d80  9a48009030       lcall 0x3090, 0x48                       -> ovl51:03d9
  0d85  83c40a           add sp, 0xa                              
  0d88  33d2             xor dx, dx                               
  0d8a  eb4a             jmp 0xdd6                                
  0d8c  8bda             mov bx, dx                               
  0d8e  d1e3             shl bx, 1                                
  0d90  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  0d94  6bdb1d           imul bx, bx, 0x1d                        
  0d97  b8042c           mov ax, 0x2c04                           
  0d9a  8ec0             mov es, ax                               
  0d9c  2680bffd0c02     cmp byte ptr es:[bx + 0xcfd], 2          
  0da2  7518             jne 0xdbc                                
  0da4  8bda             mov bx, dx                               
  0da6  d1e3             shl bx, 1                                
  0da8  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  0dac  6bdb1d           imul bx, bx, 0x1d                        
  0daf  b8042c           mov ax, 0x2c04                           
  0db2  8ec0             mov es, ax                               
  0db4  268a87fe0c       mov al, byte ptr es:[bx + 0xcfe]         
  0db9  98               cwde                                     
  0dba  03f0             add si, ax                               
  0dbc  8bda             mov bx, dx                               
  0dbe  d1e3             shl bx, 1                                
  0dc0  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  0dc4  6bdb1d           imul bx, bx, 0x1d                        
  0dc7  b8042c           mov ax, 0x2c04                           
  0dca  8ec0             mov es, ax                               
  0dcc  2680bffd0c08     cmp byte ptr es:[bx + 0xcfd], 8          
  0dd2  7501             jne 0xdd5                                
  0dd4  46               inc si                                   
  0dd5  42               inc dx                                   
  0dd6  3b162e48         cmp dx, word ptr [0x482e]                
  0dda  7cb0             jl 0xd8c                                 
  0ddc  8bc6             mov ax, si                               
  0dde  5e               pop si                                   
  0ddf  5d               pop bp                                   
  0de0  cb               retf                                     

ovl38_0de1:  ; ENTRY
  0de1  55               push bp                                  
  0de2  8bec             mov bp, sp                               
  0de4  6a0b             push 0xb                                 
  0de6  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  0deb  59               pop cx                                   
  0dec  c706560dffff     mov word ptr [0xd56], 0xffff             
  0df2  6a1d             push 0x1d                                
  0df4  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  0df9  59               pop cx                                   
  0dfa  89165a0d         mov word ptr [0xd5a], dx                 
  0dfe  a3580d           mov word ptr [0xd58], ax                 
  0e01  33d2             xor dx, dx                               
  0e03  eb23             jmp 0xe28                                
  0e05  b8042c           mov ax, 0x2c04                           
  0e08  8ec0             mov es, ax                               
  0e0a  268b1e1001       mov bx, word ptr es:[0x110]              
  0e0f  6bdb1d           imul bx, bx, 0x1d                        
  0e12  03da             add bx, dx                               
  0e14  b8042c           mov ax, 0x2c04                           
  0e17  8ec0             mov es, ax                               
  0e19  268a870b06       mov al, byte ptr es:[bx + 0x60b]         
  0e1e  c41e580d         les bx, ptr [0xd58]                      
  0e22  03da             add bx, dx                               
  0e24  268807           mov byte ptr es:[bx], al                 
  0e27  42               inc dx                                   
  0e28  83fa1d           cmp dx, 0x1d                             
  0e2b  7cd8             jl 0xe05                                 
  0e2d  c7066a160100     mov word ptr [0x166a], 1                 
  0e33  6a00             push 0                                   
  0e35  90               nop                                      
  0e36  0e               push cs                                  
  0e37  e81000           call 0xe4a                               
  0e3a  59               pop cx                                   
  0e3b  6a1a             push 0x1a                                
  0e3d  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  0e42  59               pop cx                                   
  0e43  90               nop                                      
  0e44  0e               push cs                                  
  0e45  e81f02           call 0x1067                              
  0e48  5d               pop bp                                   
  0e49  cb               retf                                     

ovl38_0e4a:  ; ENTRY
  0e4a  55               push bp                                  
  0e4b  8bec             mov bp, sp                               
  0e4d  83ec50           sub sp, 0x50                             
  0e50  56               push si                                  
  0e51  57               push di                                  
  0e52  8b7e06           mov di, word ptr [bp + 6]                
  0e55  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0e5a  0bff             or di, di                                
  0e5c  7403             je 0xe61                                 
  0e5e  e91c01           jmp 0xf7d                                
  0e61  666800000300     push 0x30000                             
  0e67  666801000f00     push 0xf0001                             
  0e6d  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0e72  83c408           add sp, 8                                
  0e75  666a7f           push 0x7f                                
  0e78  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0e7d  83c404           add sp, 4                                
  0e80  52               push dx                                  
  0e81  50               push ax                                  
  0e82  666840014000     push 0x400140                            
  0e88  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0e8d  83c408           add sp, 8                                
  0e90  666858004000     push 0x400058                            
  0e96  1e               push ds                                  
  0e97  682a34           push 0x342a                              
  0e9a  6a00             push 0                                   
  0e9c  b8042c           mov ax, 0x2c04                           
  0e9f  8ec0             mov es, ax                               
  0ea1  26ff361001       push word ptr es:[0x110]                 
  0ea6  9a6600f930       lcall 0x30f9, 0x66                       -> ovl64:0bf7
  0eab  83c40c           add sp, 0xc                              
  0eae  666800024000     push 0x400200                            
  0eb4  1e               push ds                                  
  0eb5  682a34           push 0x342a                              
  0eb8  6a00             push 0                                   
  0eba  b8042c           mov ax, 0x2c04                           
  0ebd  8ec0             mov es, ax                               
  0ebf  26ff361001       push word ptr es:[0x110]                 
  0ec4  9a6600f930       lcall 0x30f9, 0x66                       -> ovl64:0bf7
  0ec9  83c40c           add sp, 0xc                              
  0ecc  666800000300     push 0x30000                             
  0ed2  666802000f00     push 0xf0002                             
  0ed8  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0edd  83c408           add sp, 8                                
  0ee0  b8042c           mov ax, 0x2c04                           
  0ee3  8ec0             mov es, ax                               
  0ee5  26a11001         mov ax, word ptr es:[0x110]              
  0ee9  6bc014           imul ax, ax, 0x14                        
  0eec  050000           add ax, 0                                
  0eef  68042c           push 0x2c04                              
  0ef2  50               push ax                                  
  0ef3  66687f000100     push 0x1007f                             
  0ef9  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0efe  83c404           add sp, 4                                
  0f01  52               push dx                                  
  0f02  50               push ax                                  
  0f03  16               push ss                                  
  0f04  8d46b0           lea ax, [bp - 0x50]                      
  0f07  50               push ax                                  
  0f08  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0f0d  83c40c           add sp, 0xc                              
  0f10  16               push ss                                  
  0f11  8d46b0           lea ax, [bp - 0x50]                      
  0f14  50               push ax                                  
  0f15  666840016800     push 0x680140                            
  0f1b  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0f20  83c408           add sp, 8                                
  0f23  66687f000200     push 0x2007f                             
  0f29  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0f2e  83c404           add sp, 4                                
  0f31  52               push dx                                  
  0f32  50               push ax                                  
  0f33  666840015c01     push 0x15c0140                           
  0f39  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0f3e  83c408           add sp, 8                                
  0f41  66687f000300     push 0x3007f                             
  0f47  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0f4c  83c404           add sp, 4                                
  0f4f  52               push dx                                  
  0f50  50               push ax                                  
  0f51  666840017001     push 0x1700140                           
  0f57  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0f5c  83c408           add sp, 8                                
  0f5f  66687f000400     push 0x4007f                             
  0f65  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0f6a  83c404           add sp, 4                                
  0f6d  52               push dx                                  
  0f6e  50               push ax                                  
  0f6f  666840018401     push 0x1840140                           
  0f75  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0f7a  83c408           add sp, 8                                
  0f7d  666800000300     push 0x30000                             
  0f83  666802000f00     push 0xf0002                             
  0f89  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0f8e  83c408           add sp, 8                                
  0f91  33f6             xor si, si                               
  0f93  e9c000           jmp 0x1056                               
  0f96  33c9             xor cx, cx                               
  0f98  eb1f             jmp 0xfb9                                
  0f9a  b8042c           mov ax, 0x2c04                           
  0f9d  8ec0             mov es, ax                               
  0f9f  268b1e1001       mov bx, word ptr es:[0x110]              
  0fa4  6bdb1d           imul bx, bx, 0x1d                        
  0fa7  03d9             add bx, cx                               
  0fa9  b8042c           mov ax, 0x2c04                           
  0fac  8ec0             mov es, ax                               
  0fae  268a870b06       mov al, byte ptr es:[bx + 0x60b]         
  0fb3  98               cwde                                     
  0fb4  3bc6             cmp ax, si                               
  0fb6  7406             je 0xfbe                                 
  0fb8  41               inc cx                                   
  0fb9  83f91d           cmp cx, 0x1d                             
  0fbc  7cdc             jl 0xf9a                                 
  0fbe  3936560d         cmp word ptr [0xd56], si                 
  0fc2  7512             jne 0xfd6                                
  0fc4  666a00           push 0                                   
  0fc7  b8042c           mov ax, 0x2c04                           
  0fca  8ec0             mov es, ax                               
  0fcc  26a11001         mov ax, word ptr es:[0x110]              
  0fd0  050200           add ax, 2                                
  0fd3  50               push ax                                  
  0fd4  eb05             jmp 0xfdb                                
  0fd6  666a00           push 0                                   
  0fd9  6a01             push 1                                   
  0fdb  666a00           push 0                                   
  0fde  666a00           push 0                                   
  0fe1  8bc6             mov ax, si                               
  0fe3  bb0400           mov bx, 4                                
  0fe6  99               cdq                                      
  0fe7  f7fb             idiv bx                                  
  0fe9  6bc01f           imul ax, ax, 0x1f                        
  0fec  058000           add ax, 0x80                             
  0fef  50               push ax                                  
  0ff0  8bc6             mov ax, si                               
  0ff2  99               cdq                                      
  0ff3  f7fb             idiv bx                                  
  0ff5  6bd278           imul dx, dx, 0x78                        
  0ff8  83c258           add dx, 0x58                             
  0ffb  52               push dx                                  
  0ffc  1e               push ds                                  
  0ffd  682a34           push 0x342a                              
  1000  b8042c           mov ax, 0x2c04                           
  1003  8ec0             mov es, ax                               
  1005  26ff361001       push word ptr es:[0x110]                 
  100a  51               push cx                                  
  100b  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  1010  83c41a           add sp, 0x1a                             
  1013  0bff             or di, di                                
  1015  753e             jne 0x1055                               
  1017  8bc6             mov ax, si                               
  1019  40               inc ax                                   
  101a  50               push ax                                  
  101b  1e               push ds                                  
  101c  685c0d           push 0xd5c                               
  101f  16               push ss                                  
  1020  8d46b0           lea ax, [bp - 0x50]                      
  1023  50               push ax                                  
  1024  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1029  83c40a           add sp, 0xa                              
  102c  16               push ss                                  
  102d  8d46b0           lea ax, [bp - 0x50]                      
  1030  50               push ax                                  
  1031  8bc6             mov ax, si                               
  1033  bb0400           mov bx, 4                                
  1036  99               cdq                                      
  1037  f7fb             idiv bx                                  
  1039  6bc01f           imul ax, ax, 0x1f                        
  103c  058600           add ax, 0x86                             
  103f  50               push ax                                  
  1040  8bc6             mov ax, si                               
  1042  99               cdq                                      
  1043  f7fb             idiv bx                                  
  1045  6bd278           imul dx, dx, 0x78                        
  1048  81c28000         add dx, 0x80                             
  104c  52               push dx                                  
  104d  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  1052  83c408           add sp, 8                                
  1055  46               inc si                                   
  1056  83fe1b           cmp si, 0x1b                             
  1059  7d03             jge 0x105e                               
  105b  e938ff           jmp 0xf96                                
  105e  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  1063  5f               pop di                                   
  1064  5e               pop si                                   
  1065  c9               leave                                    
  1066  cb               retf                                     

ovl38_1067:  ; ENTRY
  1067  55               push bp                                  
  1068  8bec             mov bp, sp                               
  106a  56               push si                                  
  106b  6668a9010100     push 0x101a9                             
  1071  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1076  83c404           add sp, 4                                
  1079  6668ab010100     push 0x101ab                             
  107f  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1084  83c404           add sp, 4                                
  1087  6668aa010100     push 0x101aa                             
  108d  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1092  83c404           add sp, 4                                
  1095  833e560d00       cmp word ptr [0xd56], 0                  
  109a  7d11             jge 0x10ad                               
  109c  6a02             push 2                                   
  109e  68ac01           push 0x1ac                               
  10a1  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  10a6  83c404           add sp, 4                                
  10a9  6a02             push 2                                   
  10ab  eb25             jmp 0x10d2                               
  10ad  833e560d00       cmp word ptr [0xd56], 0                  
  10b2  7504             jne 0x10b8                               
  10b4  6a02             push 2                                   
  10b6  eb0d             jmp 0x10c5                               
  10b8  833e560d1a       cmp word ptr [0xd56], 0x1a               
  10bd  7504             jne 0x10c3                               
  10bf  6a01             push 1                                   
  10c1  ebdb             jmp 0x109e                               
  10c3  6a01             push 1                                   
  10c5  68ac01           push 0x1ac                               
  10c8  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  10cd  83c404           add sp, 4                                
  10d0  6a01             push 1                                   
  10d2  68ad01           push 0x1ad                               
  10d5  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  10da  83c404           add sp, 4                                
  10dd  33f6             xor si, si                               
  10df  eb11             jmp 0x10f2                               
  10e1  6a01             push 1                                   
  10e3  8bc6             mov ax, si                               
  10e5  05ae01           add ax, 0x1ae                            
  10e8  50               push ax                                  
  10e9  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  10ee  83c404           add sp, 4                                
  10f1  46               inc si                                   
  10f2  83fe1b           cmp si, 0x1b                             
  10f5  7cea             jl 0x10e1                                
  10f7  5e               pop si                                   
  10f8  5d               pop bp                                   
  10f9  cb               retf                                     

ovl38_10fa:  ; ENTRY
  10fa  55               push bp                                  
  10fb  8bec             mov bp, sp                               
  10fd  66ff36580d       push dword ptr [0xd58]                   
  1102  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  1107  83c404           add sp, 4                                
  110a  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  110f  666a00           push 0                                   
  1112  9a2000d730       lcall 0x30d7, 0x20                       -> ovl61:0000
  1117  83c404           add sp, 4                                
  111a  5d               pop bp                                   
  111b  cb               retf                                     

ovl38_111c:  ; ENTRY
  111c  55               push bp                                  
  111d  8bec             mov bp, sp                               
  111f  33c9             xor cx, cx                               
  1121  eb23             jmp 0x1146                               
  1123  c41e580d         les bx, ptr [0xd58]                      
  1127  03d9             add bx, cx                               
  1129  268a07           mov al, byte ptr es:[bx]                 
  112c  ba042c           mov dx, 0x2c04                           
  112f  8ec2             mov es, dx                               
  1131  268b1e1001       mov bx, word ptr es:[0x110]              
  1136  6bdb1d           imul bx, bx, 0x1d                        
  1139  03d9             add bx, cx                               
  113b  ba042c           mov dx, 0x2c04                           
  113e  8ec2             mov es, dx                               
  1140  2688870b06       mov byte ptr es:[bx + 0x60b], al         
  1145  41               inc cx                                   
  1146  83f91d           cmp cx, 0x1d                             
  1149  7cd8             jl 0x1123                                
  114b  66ff36580d       push dword ptr [0xd58]                   
  1150  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  1155  83c404           add sp, 4                                
  1158  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  115d  666a00           push 0                                   
  1160  9a2000d730       lcall 0x30d7, 0x20                       -> ovl61:0000
  1165  83c404           add sp, 4                                
  1168  5d               pop bp                                   
  1169  cb               retf                                     

ovl38_116a:  ; ENTRY
  116a  55               push bp                                  
  116b  8bec             mov bp, sp                               
  116d  56               push si                                  
  116e  33f6             xor si, si                               
  1170  eb24             jmp 0x1196                               
  1172  b8042c           mov ax, 0x2c04                           
  1175  8ec0             mov es, ax                               
  1177  268a84f306       mov al, byte ptr es:[si + 0x6f3]         
  117c  ba042c           mov dx, 0x2c04                           
  117f  8ec2             mov es, dx                               
  1181  268b1e1001       mov bx, word ptr es:[0x110]              
  1186  6bdb1d           imul bx, bx, 0x1d                        
  1189  03de             add bx, si                               
  118b  ba042c           mov dx, 0x2c04                           
  118e  8ec2             mov es, dx                               
  1190  2688870b06       mov byte ptr es:[bx + 0x60b], al         
  1195  46               inc si                                   
  1196  83fe1d           cmp si, 0x1d                             
  1199  7cd7             jl 0x1172                                
  119b  c706560dffff     mov word ptr [0xd56], 0xffff             
  11a1  6a01             push 1                                   
  11a3  0e               push cs                                  
  11a4  e8a3fc           call 0xe4a                               
  11a7  59               pop cx                                   
  11a8  0e               push cs                                  
  11a9  e8bbfe           call 0x1067                              
  11ac  5e               pop si                                   
  11ad  5d               pop bp                                   
  11ae  cb               retf                                     

ovl38_11af:  ; ENTRY
  11af  55               push bp                                  
  11b0  8bec             mov bp, sp                               
  11b2  83ec02           sub sp, 2                                
  11b5  56               push si                                  
  11b6  57               push di                                  
  11b7  33c9             xor cx, cx                               
  11b9  eb25             jmp 0x11e0                               
  11bb  b8042c           mov ax, 0x2c04                           
  11be  8ec0             mov es, ax                               
  11c0  268b1e1001       mov bx, word ptr es:[0x110]              
  11c5  6bdb1d           imul bx, bx, 0x1d                        
  11c8  03d9             add bx, cx                               
  11ca  b8042c           mov ax, 0x2c04                           
  11cd  8ec0             mov es, ax                               
  11cf  268a870b06       mov al, byte ptr es:[bx + 0x60b]         
  11d4  98               cwde                                     
  11d5  3b06560d         cmp ax, word ptr [0xd56]                 
  11d9  7504             jne 0x11df                               
  11db  8bf1             mov si, cx                               
  11dd  eb06             jmp 0x11e5                               
  11df  41               inc cx                                   
  11e0  83f91d           cmp cx, 0x1d                             
  11e3  7cd6             jl 0x11bb                                
  11e5  33c9             xor cx, cx                               
  11e7  eb28             jmp 0x1211                               
  11e9  b8042c           mov ax, 0x2c04                           
  11ec  8ec0             mov es, ax                               
  11ee  268b1e1001       mov bx, word ptr es:[0x110]              
  11f3  6bdb1d           imul bx, bx, 0x1d                        
  11f6  03d9             add bx, cx                               
  11f8  b8042c           mov ax, 0x2c04                           
  11fb  8ec0             mov es, ax                               
  11fd  268a870b06       mov al, byte ptr es:[bx + 0x60b]         
  1202  98               cwde                                     
  1203  8b16560d         mov dx, word ptr [0xd56]                 
  1207  4a               dec dx                                   
  1208  3bc2             cmp ax, dx                               
  120a  7504             jne 0x1210                               
  120c  8bf9             mov di, cx                               
  120e  eb06             jmp 0x1216                               
  1210  41               inc cx                                   
  1211  83f91d           cmp cx, 0x1d                             
  1214  7cd3             jl 0x11e9                                
  1216  b8042c           mov ax, 0x2c04                           
  1219  8ec0             mov es, ax                               
  121b  268b1e1001       mov bx, word ptr es:[0x110]              
  1220  6bdb1d           imul bx, bx, 0x1d                        
  1223  03de             add bx, si                               
  1225  b8042c           mov ax, 0x2c04                           
  1228  8ec0             mov es, ax                               
  122a  268a870b06       mov al, byte ptr es:[bx + 0x60b]         
  122f  98               cwde                                     
  1230  8946fe           mov word ptr [bp - 2], ax                
  1233  b8042c           mov ax, 0x2c04                           
  1236  8ec0             mov es, ax                               
  1238  268b1e1001       mov bx, word ptr es:[0x110]              
  123d  6bdb1d           imul bx, bx, 0x1d                        
  1240  03df             add bx, di                               
  1242  b8042c           mov ax, 0x2c04                           
  1245  8ec0             mov es, ax                               
  1247  268a870b06       mov al, byte ptr es:[bx + 0x60b]         
  124c  ba042c           mov dx, 0x2c04                           
  124f  8ec2             mov es, dx                               
  1251  268b1e1001       mov bx, word ptr es:[0x110]              
  1256  6bdb1d           imul bx, bx, 0x1d                        
  1259  03de             add bx, si                               
  125b  ba042c           mov dx, 0x2c04                           
  125e  8ec2             mov es, dx                               
  1260  2688870b06       mov byte ptr es:[bx + 0x60b], al         
  1265  b8042c           mov ax, 0x2c04                           
  1268  8ec0             mov es, ax                               
  126a  268b1e1001       mov bx, word ptr es:[0x110]              
  126f  6bdb1d           imul bx, bx, 0x1d                        
  1272  03df             add bx, di                               
  1274  b8042c           mov ax, 0x2c04                           
  1277  8a56fe           mov dl, byte ptr [bp - 2]                
  127a  8ec0             mov es, ax                               
  127c  2688970b06       mov byte ptr es:[bx + 0x60b], dl         
  1281  ff0e560d         dec word ptr [0xd56]                     
  1285  6a01             push 1                                   
  1287  0e               push cs                                  
  1288  e8bffb           call 0xe4a                               
  128b  59               pop cx                                   
  128c  0e               push cs                                  
  128d  e8d7fd           call 0x1067                              
  1290  5f               pop di                                   
  1291  5e               pop si                                   
  1292  c9               leave                                    
  1293  cb               retf                                     

ovl38_1294:  ; ENTRY
  1294  55               push bp                                  
  1295  8bec             mov bp, sp                               
  1297  83ec02           sub sp, 2                                
  129a  56               push si                                  
  129b  57               push di                                  
  129c  33c9             xor cx, cx                               
  129e  eb25             jmp 0x12c5                               
  12a0  b8042c           mov ax, 0x2c04                           
  12a3  8ec0             mov es, ax                               
  12a5  268b1e1001       mov bx, word ptr es:[0x110]              
  12aa  6bdb1d           imul bx, bx, 0x1d                        
  12ad  03d9             add bx, cx                               
  12af  b8042c           mov ax, 0x2c04                           
  12b2  8ec0             mov es, ax                               
  12b4  268a870b06       mov al, byte ptr es:[bx + 0x60b]         
  12b9  98               cwde                                     
  12ba  3b06560d         cmp ax, word ptr [0xd56]                 
  12be  7504             jne 0x12c4                               
  12c0  8bf1             mov si, cx                               
  12c2  eb06             jmp 0x12ca                               
  12c4  41               inc cx                                   
  12c5  83f91d           cmp cx, 0x1d                             
  12c8  7cd6             jl 0x12a0                                
  12ca  33c9             xor cx, cx                               
  12cc  eb28             jmp 0x12f6                               
  12ce  b8042c           mov ax, 0x2c04                           
  12d1  8ec0             mov es, ax                               
  12d3  268b1e1001       mov bx, word ptr es:[0x110]              
  12d8  6bdb1d           imul bx, bx, 0x1d                        
  12db  03d9             add bx, cx                               
  12dd  b8042c           mov ax, 0x2c04                           
  12e0  8ec0             mov es, ax                               
  12e2  268a870b06       mov al, byte ptr es:[bx + 0x60b]         
  12e7  98               cwde                                     
  12e8  8b16560d         mov dx, word ptr [0xd56]                 
  12ec  42               inc dx                                   
  12ed  3bc2             cmp ax, dx                               
  12ef  7504             jne 0x12f5                               
  12f1  8bf9             mov di, cx                               
  12f3  eb06             jmp 0x12fb                               
  12f5  41               inc cx                                   
  12f6  83f91d           cmp cx, 0x1d                             
  12f9  7cd3             jl 0x12ce                                
  12fb  b8042c           mov ax, 0x2c04                           
  12fe  8ec0             mov es, ax                               
  1300  268b1e1001       mov bx, word ptr es:[0x110]              
  1305  6bdb1d           imul bx, bx, 0x1d                        
  1308  03de             add bx, si                               
  130a  b8042c           mov ax, 0x2c04                           
  130d  8ec0             mov es, ax                               
  130f  268a870b06       mov al, byte ptr es:[bx + 0x60b]         
  1314  98               cwde                                     
  1315  8946fe           mov word ptr [bp - 2], ax                
  1318  b8042c           mov ax, 0x2c04                           
  131b  8ec0             mov es, ax                               
  131d  268b1e1001       mov bx, word ptr es:[0x110]              
  1322  6bdb1d           imul bx, bx, 0x1d                        
  1325  03df             add bx, di                               
  1327  b8042c           mov ax, 0x2c04                           
  132a  8ec0             mov es, ax                               
  132c  268a870b06       mov al, byte ptr es:[bx + 0x60b]         
  1331  ba042c           mov dx, 0x2c04                           
  1334  8ec2             mov es, dx                               
  1336  268b1e1001       mov bx, word ptr es:[0x110]              
  133b  6bdb1d           imul bx, bx, 0x1d                        
  133e  03de             add bx, si                               
  1340  ba042c           mov dx, 0x2c04                           
  1343  8ec2             mov es, dx                               
  1345  2688870b06       mov byte ptr es:[bx + 0x60b], al         
  134a  b8042c           mov ax, 0x2c04                           
  134d  8ec0             mov es, ax                               
  134f  268b1e1001       mov bx, word ptr es:[0x110]              
  1354  6bdb1d           imul bx, bx, 0x1d                        
  1357  03df             add bx, di                               
  1359  b8042c           mov ax, 0x2c04                           
  135c  8a56fe           mov dl, byte ptr [bp - 2]                
  135f  8ec0             mov es, ax                               
  1361  2688970b06       mov byte ptr es:[bx + 0x60b], dl         
  1366  ff06560d         inc word ptr [0xd56]                     
  136a  6a01             push 1                                   
  136c  0e               push cs                                  
  136d  e8dafa           call 0xe4a                               
  1370  59               pop cx                                   
  1371  0e               push cs                                  
  1372  e8f2fc           call 0x1067                              
  1375  5f               pop di                                   
  1376  5e               pop si                                   
  1377  c9               leave                                    
  1378  cb               retf                                     

ovl38_1379:  ; ENTRY
  1379  55               push bp                                  
  137a  8bec             mov bp, sp                               
  137c  83ec02           sub sp, 2                                
  137f  56               push si                                  
  1380  57               push di                                  
  1381  8b4e06           mov cx, word ptr [bp + 6]                
  1384  390e560d         cmp word ptr [0xd56], cx                 
  1388  7503             jne 0x138d                               
  138a  e9d300           jmp 0x1460                               
  138d  833e560d00       cmp word ptr [0xd56], 0                  
  1392  7d07             jge 0x139b                               
  1394  890e560d         mov word ptr [0xd56], cx                 
  1398  e9cb00           jmp 0x1466                               
  139b  33d2             xor dx, dx                               
  139d  eb25             jmp 0x13c4                               
  139f  b8042c           mov ax, 0x2c04                           
  13a2  8ec0             mov es, ax                               
  13a4  268b1e1001       mov bx, word ptr es:[0x110]              
  13a9  6bdb1d           imul bx, bx, 0x1d                        
  13ac  03da             add bx, dx                               
  13ae  b8042c           mov ax, 0x2c04                           
  13b1  8ec0             mov es, ax                               
  13b3  268a870b06       mov al, byte ptr es:[bx + 0x60b]         
  13b8  98               cwde                                     
  13b9  3b06560d         cmp ax, word ptr [0xd56]                 
  13bd  7504             jne 0x13c3                               
  13bf  8bf2             mov si, dx                               
  13c1  eb06             jmp 0x13c9                               
  13c3  42               inc dx                                   
  13c4  83fa1d           cmp dx, 0x1d                             
  13c7  7cd6             jl 0x139f                                
  13c9  33d2             xor dx, dx                               
  13cb  eb23             jmp 0x13f0                               
  13cd  b8042c           mov ax, 0x2c04                           
  13d0  8ec0             mov es, ax                               
  13d2  268b1e1001       mov bx, word ptr es:[0x110]              
  13d7  6bdb1d           imul bx, bx, 0x1d                        
  13da  03da             add bx, dx                               
  13dc  b8042c           mov ax, 0x2c04                           
  13df  8ec0             mov es, ax                               
  13e1  268a870b06       mov al, byte ptr es:[bx + 0x60b]         
  13e6  98               cwde                                     
  13e7  3bc1             cmp ax, cx                               
  13e9  7504             jne 0x13ef                               
  13eb  8bfa             mov di, dx                               
  13ed  eb06             jmp 0x13f5                               
  13ef  42               inc dx                                   
  13f0  83fa1d           cmp dx, 0x1d                             
  13f3  7cd8             jl 0x13cd                                
  13f5  b8042c           mov ax, 0x2c04                           
  13f8  8ec0             mov es, ax                               
  13fa  268b1e1001       mov bx, word ptr es:[0x110]              
  13ff  6bdb1d           imul bx, bx, 0x1d                        
  1402  03de             add bx, si                               
  1404  b8042c           mov ax, 0x2c04                           
  1407  8ec0             mov es, ax                               
  1409  268a870b06       mov al, byte ptr es:[bx + 0x60b]         
  140e  98               cwde                                     
  140f  8946fe           mov word ptr [bp - 2], ax                
  1412  b8042c           mov ax, 0x2c04                           
  1415  8ec0             mov es, ax                               
  1417  268b1e1001       mov bx, word ptr es:[0x110]              
  141c  6bdb1d           imul bx, bx, 0x1d                        
  141f  03df             add bx, di                               
  1421  b8042c           mov ax, 0x2c04                           
  1424  8ec0             mov es, ax                               
  1426  268a870b06       mov al, byte ptr es:[bx + 0x60b]         
  142b  ba042c           mov dx, 0x2c04                           
  142e  8ec2             mov es, dx                               
  1430  268b1e1001       mov bx, word ptr es:[0x110]              
  1435  6bdb1d           imul bx, bx, 0x1d                        
  1438  03de             add bx, si                               
  143a  ba042c           mov dx, 0x2c04                           
  143d  8ec2             mov es, dx                               
  143f  2688870b06       mov byte ptr es:[bx + 0x60b], al         
  1444  b8042c           mov ax, 0x2c04                           
  1447  8ec0             mov es, ax                               
  1449  268b1e1001       mov bx, word ptr es:[0x110]              
  144e  6bdb1d           imul bx, bx, 0x1d                        
  1451  03df             add bx, di                               
  1453  b8042c           mov ax, 0x2c04                           
  1456  8a56fe           mov dl, byte ptr [bp - 2]                
  1459  8ec0             mov es, ax                               
  145b  2688970b06       mov byte ptr es:[bx + 0x60b], dl         
  1460  c706560dffff     mov word ptr [0xd56], 0xffff             
  1466  6a01             push 1                                   
  1468  0e               push cs                                  
  1469  e8def9           call 0xe4a                               
  146c  59               pop cx                                   
  146d  0e               push cs                                  
  146e  e8f6fb           call 0x1067                              
  1471  5f               pop di                                   
  1472  5e               pop si                                   
  1473  c9               leave                                    
  1474  cb               retf                                     

ovl38_1475:  ; ENTRY
  1475  55               push bp                                  
  1476  8bec             mov bp, sp                               
  1478  83ec3e           sub sp, 0x3e                             
  147b  56               push si                                  
  147c  833e741100       cmp word ptr [0x1174], 0                 
  1481  7550             jne 0x14d3                               
  1483  33f6             xor si, si                               
  1485  eb20             jmp 0x14a7                               
  1487  b8042c           mov ax, 0x2c04                           
  148a  8ec0             mov es, ax                               
  148c  268b1e1001       mov bx, word ptr es:[0x110]              
  1491  6bdb1d           imul bx, bx, 0x1d                        
  1494  03de             add bx, si                               
  1496  b8042c           mov ax, 0x2c04                           
  1499  8ec0             mov es, ax                               
  149b  268a870b06       mov al, byte ptr es:[bx + 0x60b]         
  14a0  98               cwde                                     
  14a1  3b4606           cmp ax, word ptr [bp + 6]                
  14a4  7406             je 0x14ac                                
  14a6  46               inc si                                   
  14a7  83fe1d           cmp si, 0x1d                             
  14aa  7cdb             jl 0x1487                                
  14ac  16               push ss                                  
  14ad  8d46c2           lea ax, [bp - 0x3e]                      
  14b0  50               push ax                                  
  14b1  56               push si                                  
  14b2  9a84005830       lcall 0x3058, 0x84                       -> ovl44:14ac
  14b7  83c406           add sp, 6                                
  14ba  ff760a           push word ptr [bp + 0xa]                 
  14bd  ff7608           push word ptr [bp + 8]                   
  14c0  66ff76dc         push dword ptr [bp - 0x24]               
  14c4  ff76d8           push word ptr [bp - 0x28]                
  14c7  ff76da           push word ptr [bp - 0x26]                
  14ca  56               push si                                  
  14cb  9a3e006c30       lcall 0x306c, 0x3e                       -> ovl46:032a
  14d0  83c40e           add sp, 0xe                              
  14d3  5e               pop si                                   
  14d4  c9               leave                                    
  14d5  cb               retf                                     
