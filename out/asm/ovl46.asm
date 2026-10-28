; ovl46 stub 306c file_off 0x69120 size 0x1542

ovl46_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec10           sub sp, 0x10                             
  0006  56               push si                                  
  0007  57               push di                                  
  0008  8b7606           mov si, word ptr [bp + 6]                
  000b  8b7e08           mov di, word ptr [bp + 8]                
  000e  8bdf             mov bx, di                               
  0010  69dbe000         imul bx, bx, 0xe0                        
  0014  8bc6             mov ax, si                               
  0016  d1e0             shl ax, 1                                
  0018  03d8             add bx, ax                               
  001a  b81d1e           mov ax, 0x1e1d                           
  001d  8ec0             mov es, ax                               
  001f  268a870100       mov al, byte ptr es:[bx + 1]             
  0024  250f00           and ax, 0xf                              
  0027  8946fe           mov word ptr [bp - 2], ax                
  002a  8bdf             mov bx, di                               
  002c  69dbe000         imul bx, bx, 0xe0                        
  0030  8bc6             mov ax, si                               
  0032  d1e0             shl ax, 1                                
  0034  03d8             add bx, ax                               
  0036  b81d1e           mov ax, 0x1e1d                           
  0039  8ec0             mov es, ax                               
  003b  268a9f0000       mov bl, byte ptr es:[bx]                 
  0040  81e3ff00         and bx, 0xff                             
  0044  b8042c           mov ax, 0x2c04                           
  0047  8ec0             mov es, ax                               
  0049  268a871007       mov al, byte ptr es:[bx + 0x710]         
  004e  98               cwde                                     
  004f  8946fc           mov word ptr [bp - 4], ax                
  0052  8bdf             mov bx, di                               
  0054  6bdb70           imul bx, bx, 0x70                        
  0057  03de             add bx, si                               
  0059  b8d919           mov ax, 0x19d9                           
  005c  8ec0             mov es, ax                               
  005e  268a870000       mov al, byte ptr es:[bx]                 
  0063  251f00           and ax, 0x1f                             
  0066  0bc0             or ax, ax                                
  0068  7405             je 0x6f                                  
  006a  c746fc0000       mov word ptr [bp - 4], 0                 
  006f  8bdf             mov bx, di                               
  0071  69dbe000         imul bx, bx, 0xe0                        
  0075  8bc6             mov ax, si                               
  0077  d1e0             shl ax, 1                                
  0079  03d8             add bx, ax                               
  007b  b81d1e           mov ax, 0x1e1d                           
  007e  8ec0             mov es, ax                               
  0080  268a870100       mov al, byte ptr es:[bx + 1]             
  0085  c1e807           shr ax, 7                                
  0088  250100           and ax, 1                                
  008b  8946f6           mov word ptr [bp - 0xa], ax              
  008e  8bdf             mov bx, di                               
  0090  69dbe000         imul bx, bx, 0xe0                        
  0094  8bc6             mov ax, si                               
  0096  d1e0             shl ax, 1                                
  0098  03d8             add bx, ax                               
  009a  b81d1e           mov ax, 0x1e1d                           
  009d  8ec0             mov es, ax                               
  009f  268a870100       mov al, byte ptr es:[bx + 1]             
  00a4  c1e804           shr ax, 4                                
  00a7  250100           and ax, 1                                
  00aa  8946fa           mov word ptr [bp - 6], ax                
  00ad  9a9608a908       lcall 0x8a9, 0x896                       -> 08a9:0896
  00b2  8946f4           mov word ptr [bp - 0xc], ax              
  00b5  837e0a01         cmp word ptr [bp + 0xa], 1               
  00b9  7403             je 0xbe                                  
  00bb  e9c300           jmp 0x181                                
  00be  8b5ef4           mov bx, word ptr [bp - 0xc]              
  00c1  83eb02           sub bx, 2                                
  00c4  83fb09           cmp bx, 9                                
  00c7  7603             jbe 0xcc                                 
  00c9  e94602           jmp 0x312                                
  00cc  d1e3             shl bx, 1                                
  00ce  2effa71603       jmp word ptr cs:[bx + 0x316]             
ovl46_00d3:  ; case
  00d3  666801000100     push 0x10001                             
  00d9  9a07008c0c       lcall 0xc8c, 7                           -> 0c8c:0007
  00de  83c404           add sp, 4                                
  00e1  e92e02           jmp 0x312                                
ovl46_00e4:  ; case
  00e4  16               push ss                                  
  00e5  8d46f0           lea ax, [bp - 0x10]                      
  00e8  50               push ax                                  
  00e9  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  00ee  83c404           add sp, 4                                
  00f1  66ff76f0         push dword ptr [bp - 0x10]               
  00f5  9a2a00d730       lcall 0x30d7, 0x2a                       -> ovl61:0e04
  00fa  83c404           add sp, 4                                
  00fd  c70676110100     mov word ptr [0x1176], 1                 
  0103  e90c02           jmp 0x312                                
ovl46_0106:  ; case
  0106  57               push di                                  
  0107  56               push si                                  
  0108  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  010d  83c404           add sp, 4                                
  0110  0bc0             or ax, ax                                
  0112  7c02             jl 0x116                                 
  0114  eb32             jmp 0x148                                
  0116  57               push di                                  
  0117  56               push si                                  
  0118  6a04             push 4                                   
  011a  eb30             jmp 0x14c                                
ovl46_011c:  ; case
  011c  57               push di                                  
  011d  56               push si                                  
  011e  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  0123  83c404           add sp, 4                                
  0126  6bc041           imul ax, ax, 0x41                        
  0129  ba042c           mov dx, 0x2c04                           
  012c  8bd8             mov bx, ax                               
  012e  8ec2             mov es, dx                               
  0130  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0135  98               cwde                                     
  0136  ba042c           mov dx, 0x2c04                           
  0139  8ec2             mov es, dx                               
  013b  263b061001       cmp ax, word ptr es:[0x110]              
  0140  7506             jne 0x148                                
  0142  57               push di                                  
  0143  56               push si                                  
  0144  6a02             push 2                                   
  0146  eb04             jmp 0x14c                                
  0148  57               push di                                  
  0149  56               push si                                  
  014a  6a00             push 0                                   
  014c  9a20006430       lcall 0x3064, 0x20                       -> ovl45:0000
  0151  83c406           add sp, 6                                
  0154  e9bb01           jmp 0x312                                
ovl46_0157:  ; case
  0157  666a00           push 0                                   
  015a  9afd018c0c       lcall 0xc8c, 0x1fd                       -> 0c8c:01fd
  015f  e97cff           jmp 0xde                                 
ovl46_0162:  ; case
  0162  57               push di                                  
  0163  56               push si                                  
  0164  9a48002430       lcall 0x3024, 0x48                       -> ovl36:1f19
  0169  e972ff           jmp 0xde                                 
ovl46_016c:  ; case
  016c  6a00             push 0                                   
  016e  9a0504620b       lcall 0xb62, 0x405                       -> 0b62:0405
  0173  59               pop cx                                   
  0174  e99b01           jmp 0x312                                
ovl46_0177:  ; case
  0177  57               push di                                  
  0178  56               push si                                  
  0179  9a25002430       lcall 0x3024, 0x25                       -> ovl36:0000
  017e  e95dff           jmp 0xde                                 
  0181  837e0a02         cmp word ptr [bp + 0xa], 2               
  0185  7403             je 0x18a                                 
  0187  e98401           jmp 0x30e                                
  018a  833e741100       cmp word ptr [0x1174], 0                 
  018f  7403             je 0x194                                 
  0191  e97a01           jmp 0x30e                                
  0194  57               push di                                  
  0195  56               push si                                  
  0196  6a01             push 1                                   
  0198  9aa200f930       lcall 0x30f9, 0xa2                       -> ovl64:15ff
  019d  83c406           add sp, 6                                
  01a0  0bc0             or ax, ax                                
  01a2  7503             jne 0x1a7                                
  01a4  e96701           jmp 0x30e                                
  01a7  837efa00         cmp word ptr [bp - 6], 0                 
  01ab  7503             jne 0x1b0                                
  01ad  e99800           jmp 0x248                                
  01b0  b8042c           mov ax, 0x2c04                           
  01b3  8ec0             mov es, ax                               
  01b5  26833e2a0100     cmp word ptr es:[0x12a], 0               
  01bb  752b             jne 0x1e8                                
  01bd  8ec0             mov es, ax                               
  01bf  26a11001         mov ax, word ptr es:[0x110]              
  01c3  3b46fe           cmp ax, word ptr [bp - 2]                
  01c6  7420             je 0x1e8                                 
  01c8  8bdf             mov bx, di                               
  01ca  69dbe000         imul bx, bx, 0xe0                        
  01ce  8bc6             mov ax, si                               
  01d0  d1e0             shl ax, 1                                
  01d2  03d8             add bx, ax                               
  01d4  b81d1e           mov ax, 0x1e1d                           
  01d7  8ec0             mov es, ax                               
  01d9  268a870100       mov al, byte ptr es:[bx + 1]             
  01de  c1e805           shr ax, 5                                
  01e1  250100           and ax, 1                                
  01e4  0bc0             or ax, ax                                
  01e6  7460             je 0x248                                 
  01e8  6a01             push 1                                   
  01ea  57               push di                                  
  01eb  56               push si                                  
  01ec  90               nop                                      
  01ed  0e               push cs                                  
  01ee  e81010           call 0x1201                              
  01f1  83c406           add sp, 6                                
  01f4  8bdf             mov bx, di                               
  01f6  69dbe000         imul bx, bx, 0xe0                        
  01fa  8bc6             mov ax, si                               
  01fc  d1e0             shl ax, 1                                
  01fe  03d8             add bx, ax                               
  0200  b81d1e           mov ax, 0x1e1d                           
  0203  8ec0             mov es, ax                               
  0205  268a870100       mov al, byte ptr es:[bx + 1]             
  020a  c1e805           shr ax, 5                                
  020d  250100           and ax, 1                                
  0210  0bc0             or ax, ax                                
  0212  7427             je 0x23b                                 
  0214  b8042c           mov ax, 0x2c04                           
  0217  8ec0             mov es, ax                               
  0219  26a11001         mov ax, word ptr es:[0x110]              
  021d  3b46fe           cmp ax, word ptr [bp - 2]                
  0220  7419             je 0x23b                                 
  0222  666882000100     push 0x10082                             
  0228  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  022d  83c404           add sp, 4                                
  0230  52               push dx                                  
  0231  50               push ax                                  
  0232  666882000000     push 0x82                                
  0238  e9b900           jmp 0x2f4                                
  023b  57               push di                                  
  023c  56               push si                                  
  023d  90               nop                                      
  023e  0e               push cs                                  
  023f  e86b09           call 0xbad                               
  0242  83c404           add sp, 4                                
  0245  e9be00           jmp 0x306                                
  0248  837efc0a         cmp word ptr [bp - 4], 0xa               
  024c  751e             jne 0x26c                                
  024e  6a01             push 1                                   
  0250  57               push di                                  
  0251  56               push si                                  
  0252  90               nop                                      
  0253  0e               push cs                                  
  0254  e8aa0f           call 0x1201                              
  0257  83c406           add sp, 6                                
  025a  57               push di                                  
  025b  56               push si                                  
  025c  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  0261  83c404           add sp, 4                                
  0264  50               push ax                                  
  0265  90               nop                                      
  0266  0e               push cs                                  
  0267  e8090a           call 0xc73                               
  026a  eb44             jmp 0x2b0                                
  026c  837efc0b         cmp word ptr [bp - 4], 0xb               
  0270  7541             jne 0x2b3                                
  0272  57               push di                                  
  0273  56               push si                                  
  0274  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  0279  83c404           add sp, 4                                
  027c  8946f8           mov word ptr [bp - 8], ax                
  027f  0bc0             or ax, ax                                
  0281  7c11             jl 0x294                                 
  0283  6a01             push 1                                   
  0285  57               push di                                  
  0286  56               push si                                  
  0287  90               nop                                      
  0288  0e               push cs                                  
  0289  e8750f           call 0x1201                              
  028c  83c406           add sp, 6                                
  028f  ff76f8           push word ptr [bp - 8]                   
  0292  ebd1             jmp 0x265                                
  0294  6a01             push 1                                   
  0296  57               push di                                  
  0297  56               push si                                  
  0298  90               nop                                      
  0299  0e               push cs                                  
  029a  e8640f           call 0x1201                              
  029d  83c406           add sp, 6                                
  02a0  57               push di                                  
  02a1  56               push si                                  
  02a2  9a3e00e830       lcall 0x30e8, 0x3e                       -> ovl62:04b5
  02a7  83c404           add sp, 4                                
  02aa  50               push ax                                  
  02ab  90               nop                                      
  02ac  0e               push cs                                  
  02ad  e8270d           call 0xfd7                               
  02b0  59               pop cx                                   
  02b1  eb53             jmp 0x306                                
  02b3  837efc09         cmp word ptr [bp - 4], 9                 
  02b7  7509             jne 0x2c2                                
  02b9  57               push di                                  
  02ba  56               push si                                  
  02bb  90               nop                                      
  02bc  0e               push cs                                  
  02bd  e85c07           call 0xa1c                               
  02c0  eb80             jmp 0x242                                
  02c2  6a01             push 1                                   
  02c4  57               push di                                  
  02c5  56               push si                                  
  02c6  90               nop                                      
  02c7  0e               push cs                                  
  02c8  e8360f           call 0x1201                              
  02cb  83c406           add sp, 6                                
  02ce  837ef600         cmp word ptr [bp - 0xa], 0               
  02d2  740a             je 0x2de                                 
  02d4  1e               push ds                                  
  02d5  685d10           push 0x105d                               ; "A way for armies to put to sea"
  02d8  1e               push ds                                  
  02d9  685810           push 0x1058                               ; "Port"
  02dc  eb20             jmp 0x2fe                                
  02de  ff76fc           push word ptr [bp - 4]                   
  02e1  688100           push 0x81                                
  02e4  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  02e9  83c404           add sp, 4                                
  02ec  52               push dx                                  
  02ed  50               push ax                                  
  02ee  ff76fc           push word ptr [bp - 4]                   
  02f1  688000           push 0x80                                
  02f4  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  02f9  83c404           add sp, 4                                
  02fc  52               push dx                                  
  02fd  50               push ax                                  
  02fe  90               nop                                      
  02ff  0e               push cs                                  
  0300  e8de0d           call 0x10e1                              
  0303  83c408           add sp, 8                                
  0306  c70674110100     mov word ptr [0x1174], 1                 
  030c  eb04             jmp 0x312                                
  030e  837e0a00         cmp word ptr [bp + 0xa], 0               
  0312  5f               pop di                                   
  0313  5e               pop si                                   
  0314  c9               leave                                    
  0315  cb               retf                                     
  0316  57011c01e4006c01 dw 0157,011c,00e4,016c,0157,0106,0177,0162,0177,00d3 jump table

ovl46_032a:  ; ENTRY
  032a  55               push bp                                  
  032b  8bec             mov bp, sp                               
  032d  83ec3a           sub sp, 0x3a                             
  0330  56               push si                                  
  0331  57               push di                                  
  0332  8b7606           mov si, word ptr [bp + 6]                
  0335  ff7612           push word ptr [bp + 0x12]                
  0338  ff7610           push word ptr [bp + 0x10]                
  033b  16               push ss                                  
  033c  8d46f8           lea ax, [bp - 8]                         
  033f  50               push ax                                  
  0340  90               nop                                      
  0341  0e               push cs                                  
  0342  e84111           call 0x1486                              
  0345  83c408           add sp, 8                                
  0348  66ff76fc         push dword ptr [bp - 4]                  
  034c  1e               push ds                                  
  034d  689444           push 0x4494                              
  0350  9afe011210       lcall 0x1012, 0x1fe                      -> 1012:01fe
  0355  83c408           add sp, 8                                
  0358  0bc0             or ax, ax                                
  035a  7503             jne 0x35f                                
  035c  e9c302           jmp 0x622                                
  035f  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0364  66833e9e4400     cmp dword ptr [0x449e], 0                
  036a  7435             je 0x3a1                                 
  036c  f706c9440a00     test word ptr [0x44c9], 0xa              
  0372  752d             jne 0x3a1                                
  0374  33ff             xor di, di                               
  0376  eb20             jmp 0x398                                
  0378  8bdf             mov bx, di                               
  037a  c1e302           shl bx, 2                                
  037d  66ffb79e44       push dword ptr [bx + 0x449e]             
  0382  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0387  83c404           add sp, 4                                
  038a  8bdf             mov bx, di                               
  038c  c1e302           shl bx, 2                                
  038f  8997b044         mov word ptr [bx + 0x44b0], dx           
  0393  8987ae44         mov word ptr [bx + 0x44ae], ax           
  0397  47               inc di                                   
  0398  a0c844           mov al, byte ptr [0x44c8]                
  039b  b400             mov ah, 0                                
  039d  3bc7             cmp ax, di                               
  039f  7fd7             jg 0x378                                 
  03a1  666a00           push 0                                   
  03a4  1e               push ds                                  
  03a5  689444           push 0x4494                              
  03a8  66ff76fc         push dword ptr [bp - 4]                  
  03ac  66ff76f8         push dword ptr [bp - 8]                  
  03b0  1e               push ds                                  
  03b1  682a34           push 0x342a                              
  03b4  ff1ed469         lcall [0x69d4]                           
  03b8  83c414           add sp, 0x14                             
  03bb  66833e9e4400     cmp dword ptr [0x449e], 0                
  03c1  7428             je 0x3eb                                 
  03c3  f706c9440a00     test word ptr [0x44c9], 0xa              
  03c9  7520             jne 0x3eb                                
  03cb  33ff             xor di, di                               
  03cd  eb13             jmp 0x3e2                                
  03cf  8bdf             mov bx, di                               
  03d1  c1e302           shl bx, 2                                
  03d4  66ffb79e44       push dword ptr [bx + 0x449e]             
  03d9  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  03de  83c404           add sp, 4                                
  03e1  47               inc di                                   
  03e2  a0c844           mov al, byte ptr [0x44c8]                
  03e5  b400             mov ah, 0                                
  03e7  3bc7             cmp ax, di                               
  03e9  7fe4             jg 0x3cf                                 
  03eb  8b46f8           mov ax, word ptr [bp - 8]                
  03ee  a39044           mov word ptr [0x4490], ax                
  03f1  8b46fa           mov ax, word ptr [bp - 6]                
  03f4  a39244           mov word ptr [0x4492], ax                
  03f7  1e               push ds                                  
  03f8  688844           push 0x4488                              
  03fb  8d46f8           lea ax, [bp - 8]                         
  03fe  16               push ss                                  
  03ff  50               push ax                                  
  0400  b90800           mov cx, 8                                
  0403  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  0408  6a28             push 0x28                                
  040a  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  040f  59               pop cx                                   
  0410  66ff365010       push dword ptr [0x1050]                  
  0415  1e               push ds                                  
  0416  686d54           push 0x546d                              
  0419  66ff369044       push dword ptr [0x4490]                  
  041e  1e               push ds                                  
  041f  682a34           push 0x342a                              
  0422  66ff365410       push dword ptr [0x1054]                  
  0427  66ff365010       push dword ptr [0x1050]                  
  042c  1e               push ds                                  
  042d  68a854           push 0x54a8                              
  0430  ff1ec869         lcall [0x69c8]                           
  0434  83c41c           add sp, 0x1c                             
  0437  666800000300     push 0x30000                             
  043d  666802000f00     push 0xf0002                             
  0443  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0448  83c408           add sp, 8                                
  044b  56               push si                                  
  044c  9a89005830       lcall 0x3058, 0x89                       -> ovl44:14f4
  0451  59               pop cx                                   
  0452  52               push dx                                  
  0453  50               push ax                                  
  0454  a19244           mov ax, word ptr [0x4492]                
  0457  050800           add ax, 8                                
  045a  50               push ax                                  
  045b  a19044           mov ax, word ptr [0x4490]                
  045e  057000           add ax, 0x70                             
  0461  50               push ax                                  
  0462  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0467  83c408           add sp, 8                                
  046a  666a00           push 0                                   
  046d  666800000100     push 0x10000                             
  0473  666a00           push 0                                   
  0476  6a00             push 0                                   
  0478  a19244           mov ax, word ptr [0x4492]                
  047b  051f00           add ax, 0x1f                             
  047e  50               push ax                                  
  047f  a19044           mov ax, word ptr [0x4490]                
  0482  056000           add ax, 0x60                             
  0485  50               push ax                                  
  0486  1e               push ds                                  
  0487  682a34           push 0x342a                              
  048a  b8042c           mov ax, 0x2c04                           
  048d  8ec0             mov es, ax                               
  048f  26ff361001       push word ptr es:[0x110]                 
  0494  56               push si                                  
  0495  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  049a  83c41a           add sp, 0x1a                             
  049d  ff760a           push word ptr [bp + 0xa]                 
  04a0  1e               push ds                                  
  04a1  687c10           push 0x107c                               ; "Strength: %d"
  04a4  16               push ss                                  
  04a5  8d46c6           lea ax, [bp - 0x3a]                      
  04a8  50               push ax                                  
  04a9  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  04ae  83c40a           add sp, 0xa                              
  04b1  16               push ss                                  
  04b2  8d46c6           lea ax, [bp - 0x3a]                      
  04b5  50               push ax                                  
  04b6  a19244           mov ax, word ptr [0x4492]                
  04b9  054200           add ax, 0x42                             
  04bc  50               push ax                                  
  04bd  a19044           mov ax, word ptr [0x4490]                
  04c0  056800           add ax, 0x68                             
  04c3  50               push ax                                  
  04c4  9a5700c130       lcall 0x30c1, 0x57                       -> ovl59:0103
  04c9  83c408           add sp, 8                                
  04cc  ff760e           push word ptr [bp + 0xe]                 
  04cf  1e               push ds                                  
  04d0  688910           push 0x1089                               ; "Movement: %d"
  04d3  16               push ss                                  
  04d4  8d46c6           lea ax, [bp - 0x3a]                      
  04d7  50               push ax                                  
  04d8  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  04dd  83c40a           add sp, 0xa                              
  04e0  16               push ss                                  
  04e1  8d46c6           lea ax, [bp - 0x3a]                      
  04e4  50               push ax                                  
  04e5  a19244           mov ax, word ptr [0x4492]                
  04e8  054200           add ax, 0x42                             
  04eb  50               push ax                                  
  04ec  a19044           mov ax, word ptr [0x4490]                
  04ef  057800           add ax, 0x78                             
  04f2  50               push ax                                  
  04f3  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  04f8  83c408           add sp, 8                                
  04fb  ff7608           push word ptr [bp + 8]                   
  04fe  1e               push ds                                  
  04ff  689610           push 0x1096                               ; "Time: %d"
  0502  16               push ss                                  
  0503  8d46c6           lea ax, [bp - 0x3a]                      
  0506  50               push ax                                  
  0507  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  050c  83c40a           add sp, 0xa                              
  050f  16               push ss                                  
  0510  8d46c6           lea ax, [bp - 0x3a]                      
  0513  50               push ax                                  
  0514  a19244           mov ax, word ptr [0x4492]                
  0517  055600           add ax, 0x56                             
  051a  50               push ax                                  
  051b  a19044           mov ax, word ptr [0x4490]                
  051e  056800           add ax, 0x68                             
  0521  50               push ax                                  
  0522  9a5700c130       lcall 0x30c1, 0x57                       -> ovl59:0103
  0527  83c408           add sp, 8                                
  052a  ff760c           push word ptr [bp + 0xc]                 
  052d  1e               push ds                                  
  052e  689f10           push 0x109f                               ; "Cost: %d"
  0531  16               push ss                                  
  0532  8d46c6           lea ax, [bp - 0x3a]                      
  0535  50               push ax                                  
  0536  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  053b  83c40a           add sp, 0xa                              
  053e  16               push ss                                  
  053f  8d46c6           lea ax, [bp - 0x3a]                      
  0542  50               push ax                                  
  0543  a19244           mov ax, word ptr [0x4492]                
  0546  055600           add ax, 0x56                             
  0549  50               push ax                                  
  054a  a19044           mov ax, word ptr [0x4490]                
  054d  057800           add ax, 0x78                             
  0550  50               push ax                                  
  0551  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0556  83c408           add sp, 8                                
  0559  8bde             mov bx, si                               
  055b  6bdb06           imul bx, bx, 6                           
  055e  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  0563  742c             je 0x591                                 
  0565  a19244           mov ax, word ptr [0x4492]                
  0568  056700           add ax, 0x67                             
  056b  50               push ax                                  
  056c  a19044           mov ax, word ptr [0x4490]                
  056f  056000           add ax, 0x60                             
  0572  50               push ax                                  
  0573  1e               push ds                                  
  0574  682a34           push 0x342a                              
  0577  666820000a00     push 0xa0020                             
  057d  6668b8001e00     push 0x1e00b8                            
  0583  1e               push ds                                  
  0584  68e257           push 0x57e2                              
  0587  ff1ed469         lcall [0x69d4]                           
  058b  83c414           add sp, 0x14                             
  058e  e99100           jmp 0x622                                
  0591  8bde             mov bx, si                               
  0593  6bdb06           imul bx, bx, 6                           
  0596  80bfc54500       cmp byte ptr [bx + 0x45c5], 0            
  059b  742c             je 0x5c9                                 
  059d  8bde             mov bx, si                               
  059f  6bdb06           imul bx, bx, 6                           
  05a2  80bfc64500       cmp byte ptr [bx + 0x45c6], 0            
  05a7  7420             je 0x5c9                                 
  05a9  a19244           mov ax, word ptr [0x4492]                
  05ac  056700           add ax, 0x67                             
  05af  50               push ax                                  
  05b0  a19044           mov ax, word ptr [0x4490]                
  05b3  056000           add ax, 0x60                             
  05b6  50               push ax                                  
  05b7  1e               push ds                                  
  05b8  682a34           push 0x342a                              
  05bb  666820000a00     push 0xa0020                             
  05c1  6668d8001e00     push 0x1e00d8                            
  05c7  ebba             jmp 0x583                                
  05c9  8bde             mov bx, si                               
  05cb  6bdb06           imul bx, bx, 6                           
  05ce  80bfc54500       cmp byte ptr [bx + 0x45c5], 0            
  05d3  7420             je 0x5f5                                 
  05d5  a19244           mov ax, word ptr [0x4492]                
  05d8  056700           add ax, 0x67                             
  05db  50               push ax                                  
  05dc  a19044           mov ax, word ptr [0x4490]                
  05df  056000           add ax, 0x60                             
  05e2  50               push ax                                  
  05e3  1e               push ds                                  
  05e4  682a34           push 0x342a                              
  05e7  666820000a00     push 0xa0020                             
  05ed  6668f8001e00     push 0x1e00f8                            
  05f3  eb8e             jmp 0x583                                
  05f5  8bde             mov bx, si                               
  05f7  6bdb06           imul bx, bx, 6                           
  05fa  80bfc64500       cmp byte ptr [bx + 0x45c6], 0            
  05ff  7421             je 0x622                                 
  0601  a19244           mov ax, word ptr [0x4492]                
  0604  056700           add ax, 0x67                             
  0607  50               push ax                                  
  0608  a19044           mov ax, word ptr [0x4490]                
  060b  056000           add ax, 0x60                             
  060e  50               push ax                                  
  060f  1e               push ds                                  
  0610  682a34           push 0x342a                              
  0613  666820000a00     push 0xa0020                             
  0619  666898001e00     push 0x1e0098                            
  061f  e961ff           jmp 0x583                                
  0622  5f               pop di                                   
  0623  5e               pop si                                   
  0624  c9               leave                                    
  0625  cb               retf                                     

ovl46_0626:  ; ENTRY
  0626  55               push bp                                  
  0627  8bec             mov bp, sp                               
  0629  83ec3c           sub sp, 0x3c                             
  062c  56               push si                                  
  062d  57               push di                                  
  062e  8b7606           mov si, word ptr [bp + 6]                
  0631  8b7e10           mov di, word ptr [bp + 0x10]             
  0634  83feff           cmp si, -1                               
  0637  7503             jne 0x63c                                
  0639  e9dc03           jmp 0xa18                                
  063c  ff7614           push word ptr [bp + 0x14]                
  063f  ff7612           push word ptr [bp + 0x12]                
  0642  16               push ss                                  
  0643  8d46f8           lea ax, [bp - 8]                         
  0646  50               push ax                                  
  0647  90               nop                                      
  0648  0e               push cs                                  
  0649  e83a0e           call 0x1486                              
  064c  83c408           add sp, 8                                
  064f  66ff76fc         push dword ptr [bp - 4]                  
  0653  1e               push ds                                  
  0654  689444           push 0x4494                              
  0657  9afe011210       lcall 0x1012, 0x1fe                      -> 1012:01fe
  065c  83c408           add sp, 8                                
  065f  0bc0             or ax, ax                                
  0661  7503             jne 0x666                                
  0663  e9b203           jmp 0xa18                                
  0666  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  066b  66833e9e4400     cmp dword ptr [0x449e], 0                
  0671  743d             je 0x6b0                                 
  0673  f706c9440a00     test word ptr [0x44c9], 0xa              
  0679  7535             jne 0x6b0                                
  067b  c746f60000       mov word ptr [bp - 0xa], 0               
  0680  eb24             jmp 0x6a6                                
  0682  8b5ef6           mov bx, word ptr [bp - 0xa]              
  0685  c1e302           shl bx, 2                                
  0688  66ffb79e44       push dword ptr [bx + 0x449e]             
  068d  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0692  83c404           add sp, 4                                
  0695  8b5ef6           mov bx, word ptr [bp - 0xa]              
  0698  c1e302           shl bx, 2                                
  069b  8997b044         mov word ptr [bx + 0x44b0], dx           
  069f  8987ae44         mov word ptr [bx + 0x44ae], ax           
  06a3  ff46f6           inc word ptr [bp - 0xa]                  
  06a6  a0c844           mov al, byte ptr [0x44c8]                
  06a9  b400             mov ah, 0                                
  06ab  3b46f6           cmp ax, word ptr [bp - 0xa]              
  06ae  7fd2             jg 0x682                                 
  06b0  666a00           push 0                                   
  06b3  1e               push ds                                  
  06b4  689444           push 0x4494                              
  06b7  66ff76fc         push dword ptr [bp - 4]                  
  06bb  66ff76f8         push dword ptr [bp - 8]                  
  06bf  1e               push ds                                  
  06c0  682a34           push 0x342a                              
  06c3  ff1ed469         lcall [0x69d4]                           
  06c7  83c414           add sp, 0x14                             
  06ca  66833e9e4400     cmp dword ptr [0x449e], 0                
  06d0  742f             je 0x701                                 
  06d2  f706c9440a00     test word ptr [0x44c9], 0xa              
  06d8  7527             jne 0x701                                
  06da  c746f60000       mov word ptr [bp - 0xa], 0               
  06df  eb16             jmp 0x6f7                                
  06e1  8b5ef6           mov bx, word ptr [bp - 0xa]              
  06e4  c1e302           shl bx, 2                                
  06e7  66ffb79e44       push dword ptr [bx + 0x449e]             
  06ec  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  06f1  83c404           add sp, 4                                
  06f4  ff46f6           inc word ptr [bp - 0xa]                  
  06f7  a0c844           mov al, byte ptr [0x44c8]                
  06fa  b400             mov ah, 0                                
  06fc  3b46f6           cmp ax, word ptr [bp - 0xa]              
  06ff  7fe0             jg 0x6e1                                 
  0701  8b46f8           mov ax, word ptr [bp - 8]                
  0704  a39044           mov word ptr [0x4490], ax                
  0707  8b46fa           mov ax, word ptr [bp - 6]                
  070a  a39244           mov word ptr [0x4492], ax                
  070d  1e               push ds                                  
  070e  688844           push 0x4488                              
  0711  8d46f8           lea ax, [bp - 8]                         
  0714  16               push ss                                  
  0715  50               push ax                                  
  0716  b90800           mov cx, 8                                
  0719  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  071e  6a28             push 0x28                                
  0720  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  0725  59               pop cx                                   
  0726  66ff365010       push dword ptr [0x1050]                  
  072b  1e               push ds                                  
  072c  686d54           push 0x546d                              
  072f  66ff369044       push dword ptr [0x4490]                  
  0734  1e               push ds                                  
  0735  682a34           push 0x342a                              
  0738  66ff365410       push dword ptr [0x1054]                  
  073d  66ff365010       push dword ptr [0x1050]                  
  0742  1e               push ds                                  
  0743  68a854           push 0x54a8                              
  0746  ff1ec869         lcall [0x69c8]                           
  074a  83c41c           add sp, 0x1c                             
  074d  666800000300     push 0x30000                             
  0753  666802000f00     push 0xf0002                             
  0759  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  075e  83c408           add sp, 8                                
  0761  83fe1c           cmp si, 0x1c                             
  0764  750d             jne 0x773                                
  0766  8bc7             mov ax, di                               
  0768  6bc014           imul ax, ax, 0x14                        
  076b  052302           add ax, 0x223                            
  076e  68042c           push 0x2c04                              
  0771  eb08             jmp 0x77b                                
  0773  56               push si                                  
  0774  9a89005830       lcall 0x3058, 0x89                       -> ovl44:14f4
  0779  59               pop cx                                   
  077a  52               push dx                                  
  077b  50               push ax                                  
  077c  a19244           mov ax, word ptr [0x4492]                
  077f  050800           add ax, 8                                
  0782  50               push ax                                  
  0783  a19044           mov ax, word ptr [0x4490]                
  0786  057000           add ax, 0x70                             
  0789  50               push ax                                  
  078a  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  078f  83c408           add sp, 8                                
  0792  666a00           push 0                                   
  0795  666800000100     push 0x10000                             
  079b  666a00           push 0                                   
  079e  6a00             push 0                                   
  07a0  a19244           mov ax, word ptr [0x4492]                
  07a3  051f00           add ax, 0x1f                             
  07a6  50               push ax                                  
  07a7  a19044           mov ax, word ptr [0x4490]                
  07aa  056000           add ax, 0x60                             
  07ad  50               push ax                                  
  07ae  1e               push ds                                  
  07af  682a34           push 0x342a                              
  07b2  b8042c           mov ax, 0x2c04                           
  07b5  8ec0             mov es, ax                               
  07b7  26ff361001       push word ptr es:[0x110]                 
  07bc  56               push si                                  
  07bd  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  07c2  83c41a           add sp, 0x1a                             
  07c5  83fe1c           cmp si, 0x1c                             
  07c8  7503             jne 0x7cd                                
  07ca  e9b200           jmp 0x87f                                
  07cd  0bff             or di, di                                
  07cf  7f03             jg 0x7d4                                 
  07d1  e9ab00           jmp 0x87f                                
  07d4  a19244           mov ax, word ptr [0x4492]                
  07d7  052400           add ax, 0x24                             
  07da  50               push ax                                  
  07db  a19044           mov ax, word ptr [0x4490]                
  07de  058000           add ax, 0x80                             
  07e1  50               push ax                                  
  07e2  1e               push ds                                  
  07e3  682a34           push 0x342a                              
  07e6  66ff36aa2f       push dword ptr [0x2faa]                  
  07eb  66ff36a62f       push dword ptr [0x2fa6]                  
  07f0  1e               push ds                                  
  07f1  68e257           push 0x57e2                              
  07f4  ff1ed469         lcall [0x69d4]                           
  07f8  83c414           add sp, 0x14                             
  07fb  83ff02           cmp di, 2                                
  07fe  7c27             jl 0x827                                 
  0800  a19244           mov ax, word ptr [0x4492]                
  0803  052400           add ax, 0x24                             
  0806  50               push ax                                  
  0807  a19044           mov ax, word ptr [0x4490]                
  080a  055800           add ax, 0x58                             
  080d  50               push ax                                  
  080e  1e               push ds                                  
  080f  682a34           push 0x342a                              
  0812  66ff36b22f       push dword ptr [0x2fb2]                  
  0817  66ff36ae2f       push dword ptr [0x2fae]                  
  081c  1e               push ds                                  
  081d  68e257           push 0x57e2                              
  0820  ff1ed469         lcall [0x69d4]                           
  0824  83c414           add sp, 0x14                             
  0827  83ff03           cmp di, 3                                
  082a  7c27             jl 0x853                                 
  082c  a19244           mov ax, word ptr [0x4492]                
  082f  052d00           add ax, 0x2d                             
  0832  50               push ax                                  
  0833  a19044           mov ax, word ptr [0x4490]                
  0836  058000           add ax, 0x80                             
  0839  50               push ax                                  
  083a  1e               push ds                                  
  083b  682a34           push 0x342a                              
  083e  66ff36ba2f       push dword ptr [0x2fba]                  
  0843  66ff36b62f       push dword ptr [0x2fb6]                  
  0848  1e               push ds                                  
  0849  68e257           push 0x57e2                              
  084c  ff1ed469         lcall [0x69d4]                           
  0850  83c414           add sp, 0x14                             
  0853  83ff04           cmp di, 4                                
  0856  7c27             jl 0x87f                                 
  0858  a19244           mov ax, word ptr [0x4492]                
  085b  052d00           add ax, 0x2d                             
  085e  50               push ax                                  
  085f  a19044           mov ax, word ptr [0x4490]                
  0862  055800           add ax, 0x58                             
  0865  50               push ax                                  
  0866  1e               push ds                                  
  0867  682a34           push 0x342a                              
  086a  66ff36c22f       push dword ptr [0x2fc2]                  
  086f  66ff36be2f       push dword ptr [0x2fbe]                  
  0874  1e               push ds                                  
  0875  68e257           push 0x57e2                              
  0878  ff1ed469         lcall [0x69d4]                           
  087c  83c414           add sp, 0x14                             
  087f  666800000300     push 0x30000                             
  0885  666802000f00     push 0xf0002                             
  088b  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0890  83c408           add sp, 8                                
  0893  ff760a           push word ptr [bp + 0xa]                 
  0896  1e               push ds                                  
  0897  68a810           push 0x10a8                               ; "Strength: %d"
  089a  16               push ss                                  
  089b  8d46c4           lea ax, [bp - 0x3c]                      
  089e  50               push ax                                  
  089f  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  08a4  83c40a           add sp, 0xa                              
  08a7  16               push ss                                  
  08a8  8d46c4           lea ax, [bp - 0x3c]                      
  08ab  50               push ax                                  
  08ac  a19244           mov ax, word ptr [0x4492]                
  08af  054200           add ax, 0x42                             
  08b2  50               push ax                                  
  08b3  a19044           mov ax, word ptr [0x4490]                
  08b6  056800           add ax, 0x68                             
  08b9  50               push ax                                  
  08ba  9a5700c130       lcall 0x30c1, 0x57                       -> ovl59:0103
  08bf  83c408           add sp, 8                                
  08c2  ff7608           push word ptr [bp + 8]                   
  08c5  1e               push ds                                  
  08c6  68b510           push 0x10b5                               ; "Movement: %d"
  08c9  16               push ss                                  
  08ca  8d46c4           lea ax, [bp - 0x3c]                      
  08cd  50               push ax                                  
  08ce  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  08d3  83c40a           add sp, 0xa                              
  08d6  16               push ss                                  
  08d7  8d46c4           lea ax, [bp - 0x3c]                      
  08da  50               push ax                                  
  08db  a19244           mov ax, word ptr [0x4492]                
  08de  054200           add ax, 0x42                             
  08e1  50               push ax                                  
  08e2  a19044           mov ax, word ptr [0x4490]                
  08e5  057800           add ax, 0x78                             
  08e8  50               push ax                                  
  08e9  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  08ee  83c408           add sp, 8                                
  08f1  ff760e           push word ptr [bp + 0xe]                 
  08f4  1e               push ds                                  
  08f5  68c210           push 0x10c2                               ; "Remain: %d"
  08f8  16               push ss                                  
  08f9  8d46c4           lea ax, [bp - 0x3c]                      
  08fc  50               push ax                                  
  08fd  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0902  83c40a           add sp, 0xa                              
  0905  16               push ss                                  
  0906  8d46c4           lea ax, [bp - 0x3c]                      
  0909  50               push ax                                  
  090a  a19244           mov ax, word ptr [0x4492]                
  090d  055600           add ax, 0x56                             
  0910  50               push ax                                  
  0911  a19044           mov ax, word ptr [0x4490]                
  0914  056800           add ax, 0x68                             
  0917  50               push ax                                  
  0918  9a5700c130       lcall 0x30c1, 0x57                       -> ovl59:0103
  091d  83c408           add sp, 8                                
  0920  ff760c           push word ptr [bp + 0xc]                 
  0923  1e               push ds                                  
  0924  68cd10           push 0x10cd                               ; "Upkeep: %d"
  0927  16               push ss                                  
  0928  8d46c4           lea ax, [bp - 0x3c]                      
  092b  50               push ax                                  
  092c  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0931  83c40a           add sp, 0xa                              
  0934  16               push ss                                  
  0935  8d46c4           lea ax, [bp - 0x3c]                      
  0938  50               push ax                                  
  0939  a19244           mov ax, word ptr [0x4492]                
  093c  055600           add ax, 0x56                             
  093f  50               push ax                                  
  0940  a19044           mov ax, word ptr [0x4490]                
  0943  057800           add ax, 0x78                             
  0946  50               push ax                                  
  0947  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  094c  83c408           add sp, 8                                
  094f  8bde             mov bx, si                               
  0951  6bdb06           imul bx, bx, 6                           
  0954  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  0959  742c             je 0x987                                 
  095b  a19244           mov ax, word ptr [0x4492]                
  095e  056700           add ax, 0x67                             
  0961  50               push ax                                  
  0962  a19044           mov ax, word ptr [0x4490]                
  0965  056000           add ax, 0x60                             
  0968  50               push ax                                  
  0969  1e               push ds                                  
  096a  682a34           push 0x342a                              
  096d  666820000a00     push 0xa0020                             
  0973  6668b8001e00     push 0x1e00b8                            
  0979  1e               push ds                                  
  097a  68e257           push 0x57e2                              
  097d  ff1ed469         lcall [0x69d4]                           
  0981  83c414           add sp, 0x14                             
  0984  e99100           jmp 0xa18                                
  0987  8bde             mov bx, si                               
  0989  6bdb06           imul bx, bx, 6                           
  098c  80bfc54500       cmp byte ptr [bx + 0x45c5], 0            
  0991  742c             je 0x9bf                                 
  0993  8bde             mov bx, si                               
  0995  6bdb06           imul bx, bx, 6                           
  0998  80bfc64500       cmp byte ptr [bx + 0x45c6], 0            
  099d  7420             je 0x9bf                                 
  099f  a19244           mov ax, word ptr [0x4492]                
  09a2  056700           add ax, 0x67                             
  09a5  50               push ax                                  
  09a6  a19044           mov ax, word ptr [0x4490]                
  09a9  056000           add ax, 0x60                             
  09ac  50               push ax                                  
  09ad  1e               push ds                                  
  09ae  682a34           push 0x342a                              
  09b1  666820000a00     push 0xa0020                             
  09b7  6668d8001e00     push 0x1e00d8                            
  09bd  ebba             jmp 0x979                                
  09bf  8bde             mov bx, si                               
  09c1  6bdb06           imul bx, bx, 6                           
  09c4  80bfc54500       cmp byte ptr [bx + 0x45c5], 0            
  09c9  7420             je 0x9eb                                 
  09cb  a19244           mov ax, word ptr [0x4492]                
  09ce  056700           add ax, 0x67                             
  09d1  50               push ax                                  
  09d2  a19044           mov ax, word ptr [0x4490]                
  09d5  056000           add ax, 0x60                             
  09d8  50               push ax                                  
  09d9  1e               push ds                                  
  09da  682a34           push 0x342a                              
  09dd  666820000a00     push 0xa0020                             
  09e3  6668f8001e00     push 0x1e00f8                            
  09e9  eb8e             jmp 0x979                                
  09eb  8bde             mov bx, si                               
  09ed  6bdb06           imul bx, bx, 6                           
  09f0  80bfc64500       cmp byte ptr [bx + 0x45c6], 0            
  09f5  7421             je 0xa18                                 
  09f7  a19244           mov ax, word ptr [0x4492]                
  09fa  056700           add ax, 0x67                             
  09fd  50               push ax                                  
  09fe  a19044           mov ax, word ptr [0x4490]                
  0a01  056000           add ax, 0x60                             
  0a04  50               push ax                                  
  0a05  1e               push ds                                  
  0a06  682a34           push 0x342a                              
  0a09  666820000a00     push 0xa0020                             
  0a0f  666898001e00     push 0x1e0098                            
  0a15  e961ff           jmp 0x979                                
  0a18  5f               pop di                                   
  0a19  5e               pop si                                   
  0a1a  c9               leave                                    
  0a1b  cb               retf                                     

ovl46_0a1c:  ; ENTRY
  0a1c  55               push bp                                  
  0a1d  8bec             mov bp, sp                               
  0a1f  83ec7c           sub sp, 0x7c                             
  0a22  56               push si                                  
  0a23  57               push di                                  
  0a24  8b7e06           mov di, word ptr [bp + 6]                
  0a27  6a01             push 1                                   
  0a29  ff7608           push word ptr [bp + 8]                   
  0a2c  57               push di                                  
  0a2d  16               push ss                                  
  0a2e  8d46e8           lea ax, [bp - 0x18]                      
  0a31  50               push ax                                  
  0a32  16               push ss                                  
  0a33  8d46f0           lea ax, [bp - 0x10]                      
  0a36  50               push ax                                  
  0a37  16               push ss                                  
  0a38  8d46f8           lea ax, [bp - 8]                         
  0a3b  50               push ax                                  
  0a3c  90               nop                                      
  0a3d  0e               push cs                                  
  0a3e  e8d908           call 0x131a                              
  0a41  83c412           add sp, 0x12                             
  0a44  66ff76fc         push dword ptr [bp - 4]                  
  0a48  1e               push ds                                  
  0a49  689444           push 0x4494                              
  0a4c  9afe011210       lcall 0x1012, 0x1fe                      -> 1012:01fe
  0a51  83c408           add sp, 8                                
  0a54  0bc0             or ax, ax                                
  0a56  7503             jne 0xa5b                                
  0a58  e94e01           jmp 0xba9                                
  0a5b  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0a60  66833e9e4400     cmp dword ptr [0x449e], 0                
  0a66  7435             je 0xa9d                                 
  0a68  f706c9440a00     test word ptr [0x44c9], 0xa              
  0a6e  752d             jne 0xa9d                                
  0a70  33f6             xor si, si                               
  0a72  eb20             jmp 0xa94                                
  0a74  8bde             mov bx, si                               
  0a76  c1e302           shl bx, 2                                
  0a79  66ffb79e44       push dword ptr [bx + 0x449e]             
  0a7e  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0a83  83c404           add sp, 4                                
  0a86  8bde             mov bx, si                               
  0a88  c1e302           shl bx, 2                                
  0a8b  8997b044         mov word ptr [bx + 0x44b0], dx           
  0a8f  8987ae44         mov word ptr [bx + 0x44ae], ax           
  0a93  46               inc si                                   
  0a94  a0c844           mov al, byte ptr [0x44c8]                
  0a97  b400             mov ah, 0                                
  0a99  3bc6             cmp ax, si                               
  0a9b  7fd7             jg 0xa74                                 
  0a9d  666a00           push 0                                   
  0aa0  1e               push ds                                  
  0aa1  689444           push 0x4494                              
  0aa4  66ff76fc         push dword ptr [bp - 4]                  
  0aa8  66ff76f8         push dword ptr [bp - 8]                  
  0aac  1e               push ds                                  
  0aad  682a34           push 0x342a                              
  0ab0  ff1ed469         lcall [0x69d4]                           
  0ab4  83c414           add sp, 0x14                             
  0ab7  66833e9e4400     cmp dword ptr [0x449e], 0                
  0abd  7428             je 0xae7                                 
  0abf  f706c9440a00     test word ptr [0x44c9], 0xa              
  0ac5  7520             jne 0xae7                                
  0ac7  33f6             xor si, si                               
  0ac9  eb13             jmp 0xade                                
  0acb  8bde             mov bx, si                               
  0acd  c1e302           shl bx, 2                                
  0ad0  66ffb79e44       push dword ptr [bx + 0x449e]             
  0ad5  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0ada  83c404           add sp, 4                                
  0add  46               inc si                                   
  0ade  a0c844           mov al, byte ptr [0x44c8]                
  0ae1  b400             mov ah, 0                                
  0ae3  3bc6             cmp ax, si                               
  0ae5  7fe4             jg 0xacb                                 
  0ae7  8b46f8           mov ax, word ptr [bp - 8]                
  0aea  a39044           mov word ptr [0x4490], ax                
  0aed  8b46fa           mov ax, word ptr [bp - 6]                
  0af0  a39244           mov word ptr [0x4492], ax                
  0af3  1e               push ds                                  
  0af4  688844           push 0x4488                              
  0af7  8d46f8           lea ax, [bp - 8]                         
  0afa  16               push ss                                  
  0afb  50               push ax                                  
  0afc  b90800           mov cx, 8                                
  0aff  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  0b04  6a24             push 0x24                                
  0b06  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  0b0b  59               pop cx                                   
  0b0c  66ff364810       push dword ptr [0x1048]                  
  0b11  1e               push ds                                  
  0b12  686d54           push 0x546d                              
  0b15  66ff369044       push dword ptr [0x4490]                  
  0b1a  1e               push ds                                  
  0b1b  682a34           push 0x342a                              
  0b1e  66ff364c10       push dword ptr [0x104c]                  
  0b23  66ff364810       push dword ptr [0x1048]                  
  0b28  1e               push ds                                  
  0b29  68a854           push 0x54a8                              
  0b2c  ff1ec869         lcall [0x69c8]                           
  0b30  83c41c           add sp, 0x1c                             
  0b33  16               push ss                                  
  0b34  8d4684           lea ax, [bp - 0x7c]                      
  0b37  50               push ax                                  
  0b38  16               push ss                                  
  0b39  8d46b6           lea ax, [bp - 0x4a]                      
  0b3c  50               push ax                                  
  0b3d  ff7608           push word ptr [bp + 8]                   
  0b40  57               push di                                  
  0b41  9a20009a2f       lcall 0x2f9a, 0x20                       -> ovl13:0000
  0b46  83c40c           add sp, 0xc                              
  0b49  666800000300     push 0x30000                             
  0b4f  666802000f00     push 0xf0002                             
  0b55  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0b5a  83c408           add sp, 8                                
  0b5d  16               push ss                                  
  0b5e  8d46b6           lea ax, [bp - 0x4a]                      
  0b61  50               push ax                                  
  0b62  a18a44           mov ax, word ptr [0x448a]                
  0b65  050b00           add ax, 0xb                              
  0b68  50               push ax                                  
  0b69  a18c44           mov ax, word ptr [0x448c]                
  0b6c  99               cdq                                      
  0b6d  2bc2             sub ax, dx                               
  0b6f  d1f8             sar ax, 1                                
  0b71  8b168844         mov dx, word ptr [0x4488]                
  0b75  03d0             add dx, ax                               
  0b77  83c2f8           add dx, -8                               
  0b7a  52               push dx                                  
  0b7b  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0b80  83c408           add sp, 8                                
  0b83  16               push ss                                  
  0b84  8d4684           lea ax, [bp - 0x7c]                      
  0b87  50               push ax                                  
  0b88  a18a44           mov ax, word ptr [0x448a]                
  0b8b  052300           add ax, 0x23                             
  0b8e  50               push ax                                  
  0b8f  a18c44           mov ax, word ptr [0x448c]                
  0b92  99               cdq                                      
  0b93  2bc2             sub ax, dx                               
  0b95  d1f8             sar ax, 1                                
  0b97  8b168844         mov dx, word ptr [0x4488]                
  0b9b  03d0             add dx, ax                               
  0b9d  83c2f8           add dx, -8                               
  0ba0  52               push dx                                  
  0ba1  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0ba6  83c408           add sp, 8                                
  0ba9  5f               pop di                                   
  0baa  5e               pop si                                   
  0bab  c9               leave                                    
  0bac  cb               retf                                     

ovl46_0bad:  ; ENTRY
  0bad  55               push bp                                  
  0bae  8bec             mov bp, sp                               
  0bb0  83ec04           sub sp, 4                                
  0bb3  56               push si                                  
  0bb4  57               push di                                  
  0bb5  16               push ss                                  
  0bb6  8d46fe           lea ax, [bp - 2]                         
  0bb9  50               push ax                                  
  0bba  ff7608           push word ptr [bp + 8]                   
  0bbd  ff7606           push word ptr [bp + 6]                   
  0bc0  9a7d00620b       lcall 0xb62, 0x7d                        -> 0b62:007d
  0bc5  83c408           add sp, 8                                
  0bc8  837efe00         cmp word ptr [bp - 2], 0                 
  0bcc  7503             jne 0xbd1                                
  0bce  e99e00           jmp 0xc6f                                
  0bd1  6a00             push 0                                   
  0bd3  ff76fe           push word ptr [bp - 2]                   
  0bd6  9aec09620b       lcall 0xb62, 0x9ec                       -> 0b62:09ec
  0bdb  83c404           add sp, 4                                
  0bde  a18a44           mov ax, word ptr [0x448a]                
  0be1  051000           add ax, 0x10                             
  0be4  8946fc           mov word ptr [bp - 4], ax                
  0be7  a18c44           mov ax, word ptr [0x448c]                
  0bea  99               cdq                                      
  0beb  2bc2             sub ax, dx                               
  0bed  d1f8             sar ax, 1                                
  0bef  8b3e8844         mov di, word ptr [0x4488]                
  0bf3  03f8             add di, ax                               
  0bf5  8b46fe           mov ax, word ptr [bp - 2]                
  0bf8  6bc018           imul ax, ax, 0x18                        
  0bfb  99               cdq                                      
  0bfc  2bc2             sub ax, dx                               
  0bfe  d1f8             sar ax, 1                                
  0c00  2bf8             sub di, ax                               
  0c02  83c7f0           add di, -0x10                            
  0c05  83c704           add di, 4                                
  0c08  c1ff03           sar di, 3                                
  0c0b  c1e703           shl di, 3                                
  0c0e  33f6             xor si, si                               
  0c10  eb58             jmp 0xc6a                                
  0c12  666a00           push 0                                   
  0c15  6a00             push 0                                   
  0c17  8bde             mov bx, si                               
  0c19  c1e302           shl bx, 2                                
  0c1c  c49f1e5e         les bx, ptr [bx + 0x5e1e]                
  0c20  268a4708         mov al, byte ptr es:[bx + 8]             
  0c24  98               cwde                                     
  0c25  50               push ax                                  
  0c26  8bde             mov bx, si                               
  0c28  c1e302           shl bx, 2                                
  0c2b  8b9f1e5e         mov bx, word ptr [bx + 0x5e1e]           
  0c2f  268a4707         mov al, byte ptr es:[bx + 7]             
  0c33  98               cwde                                     
  0c34  50               push ax                                  
  0c35  666a00           push 0                                   
  0c38  ff76fc           push word ptr [bp - 4]                   
  0c3b  57               push di                                  
  0c3c  1e               push ds                                  
  0c3d  682a34           push 0x342a                              
  0c40  8bde             mov bx, si                               
  0c42  c1e302           shl bx, 2                                
  0c45  8b9f1e5e         mov bx, word ptr [bx + 0x5e1e]           
  0c49  268a4705         mov al, byte ptr es:[bx + 5]             
  0c4d  98               cwde                                     
  0c4e  50               push ax                                  
  0c4f  8bde             mov bx, si                               
  0c51  c1e302           shl bx, 2                                
  0c54  8b9f1e5e         mov bx, word ptr [bx + 0x5e1e]           
  0c58  268a4704         mov al, byte ptr es:[bx + 4]             
  0c5c  98               cwde                                     
  0c5d  50               push ax                                  
  0c5e  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  0c63  83c41a           add sp, 0x1a                             
  0c66  83c718           add di, 0x18                             
  0c69  46               inc si                                   
  0c6a  3b76fe           cmp si, word ptr [bp - 2]                
  0c6d  7ca3             jl 0xc12                                 
  0c6f  5f               pop di                                   
  0c70  5e               pop si                                   
  0c71  c9               leave                                    
  0c72  cb               retf                                     

ovl46_0c73:  ; ENTRY
  0c73  55               push bp                                  
  0c74  8bec             mov bp, sp                               
  0c76  83ec10           sub sp, 0x10                             
  0c79  56               push si                                  
  0c7a  57               push di                                  
  0c7b  8b7e06           mov di, word ptr [bp + 6]                
  0c7e  8bdf             mov bx, di                               
  0c80  6bdb41           imul bx, bx, 0x41                        
  0c83  b8042c           mov ax, 0x2c04                           
  0c86  8ec0             mov es, ax                               
  0c88  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  0c8e  7530             jne 0xcc0                                
  0c90  6a03             push 3                                   
  0c92  b8042c           mov ax, 0x2c04                           
  0c95  8ec0             mov es, ax                               
  0c97  268b1e1001       mov bx, word ptr es:[0x110]              
  0c9c  d1e3             shl bx, 1                                
  0c9e  b8042c           mov ax, 0x2c04                           
  0ca1  8ec0             mov es, ax                               
  0ca3  26ffb7b000       push word ptr es:[bx + 0xb0]             
  0ca8  b8042c           mov ax, 0x2c04                           
  0cab  8ec0             mov es, ax                               
  0cad  268b1e1001       mov bx, word ptr es:[0x110]              
  0cb2  d1e3             shl bx, 1                                
  0cb4  b8042c           mov ax, 0x2c04                           
  0cb7  8ec0             mov es, ax                               
  0cb9  26ffb7a000       push word ptr es:[bx + 0xa0]             
  0cbe  eb3e             jmp 0xcfe                                
  0cc0  6a03             push 3                                   
  0cc2  8bdf             mov bx, di                               
  0cc4  6bdb41           imul bx, bx, 0x41                        
  0cc7  b8042c           mov ax, 0x2c04                           
  0cca  8ec0             mov es, ax                               
  0ccc  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0cd1  98               cwde                                     
  0cd2  d1e0             shl ax, 1                                
  0cd4  ba042c           mov dx, 0x2c04                           
  0cd7  8bd8             mov bx, ax                               
  0cd9  8ec2             mov es, dx                               
  0cdb  26ffb7b000       push word ptr es:[bx + 0xb0]             
  0ce0  8bdf             mov bx, di                               
  0ce2  6bdb41           imul bx, bx, 0x41                        
  0ce5  b8042c           mov ax, 0x2c04                           
  0ce8  8ec0             mov es, ax                               
  0cea  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0cef  98               cwde                                     
  0cf0  d1e0             shl ax, 1                                
  0cf2  ba042c           mov dx, 0x2c04                           
  0cf5  8bd8             mov bx, ax                               
  0cf7  8ec2             mov es, dx                               
  0cf9  26ffb7a000       push word ptr es:[bx + 0xa0]             
  0cfe  6a02             push 2                                   
  0d00  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0d05  83c408           add sp, 8                                
  0d08  8bc7             mov ax, di                               
  0d0a  6bc041           imul ax, ax, 0x41                        
  0d0d  058115           add ax, 0x1581                           
  0d10  68042c           push 0x2c04                              
  0d13  50               push ax                                  
  0d14  a18a44           mov ax, word ptr [0x448a]                
  0d17  050b00           add ax, 0xb                              
  0d1a  50               push ax                                  
  0d1b  a18c44           mov ax, word ptr [0x448c]                
  0d1e  99               cdq                                      
  0d1f  2bc2             sub ax, dx                               
  0d21  d1f8             sar ax, 1                                
  0d23  8b168844         mov dx, word ptr [0x4488]                
  0d27  03d0             add dx, ax                               
  0d29  83c2f8           add dx, -8                               
  0d2c  52               push dx                                  
  0d2d  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0d32  83c408           add sp, 8                                
  0d35  8bdf             mov bx, di                               
  0d37  6bdb41           imul bx, bx, 0x41                        
  0d3a  b8042c           mov ax, 0x2c04                           
  0d3d  8ec0             mov es, ax                               
  0d3f  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  0d44  69dbe000         imul bx, bx, 0xe0                        
  0d48  8bf7             mov si, di                               
  0d4a  6bf641           imul si, si, 0x41                        
  0d4d  b8042c           mov ax, 0x2c04                           
  0d50  8ec0             mov es, ax                               
  0d52  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  0d57  d1e0             shl ax, 1                                
  0d59  03d8             add bx, ax                               
  0d5b  b81d1e           mov ax, 0x1e1d                           
  0d5e  8ec0             mov es, ax                               
  0d60  268a9f0000       mov bl, byte ptr es:[bx]                 
  0d65  81e3ff00         and bx, 0xff                             
  0d69  b8042c           mov ax, 0x2c04                           
  0d6c  8ec0             mov es, ax                               
  0d6e  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  0d74  7425             je 0xd9b                                 
  0d76  1e               push ds                                  
  0d77  68d810           push 0x10d8                               ; "Razed!"
  0d7a  a18a44           mov ax, word ptr [0x448a]                
  0d7d  052300           add ax, 0x23                             
  0d80  50               push ax                                  
  0d81  a18c44           mov ax, word ptr [0x448c]                
  0d84  99               cdq                                      
  0d85  2bc2             sub ax, dx                               
  0d87  d1f8             sar ax, 1                                
  0d89  8b168844         mov dx, word ptr [0x4488]                
  0d8d  03d0             add dx, ax                               
  0d8f  83c2f8           add dx, -8                               
  0d92  52               push dx                                  
  0d93  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0d98  e93901           jmp 0xed4                                
  0d9b  8bdf             mov bx, di                               
  0d9d  6bdb41           imul bx, bx, 0x41                        
  0da0  b8042c           mov ax, 0x2c04                           
  0da3  8ec0             mov es, ax                               
  0da5  2680bf921508     cmp byte ptr es:[bx + 0x1592], 8         
  0dab  7d5e             jge 0xe0b                                
  0dad  a18a44           mov ax, word ptr [0x448a]                
  0db0  050a00           add ax, 0xa                              
  0db3  50               push ax                                  
  0db4  a18844           mov ax, word ptr [0x4488]                
  0db7  051800           add ax, 0x18                             
  0dba  50               push ax                                  
  0dbb  1e               push ds                                  
  0dbc  682a34           push 0x342a                              
  0dbf  6a03             push 3                                   
  0dc1  8bdf             mov bx, di                               
  0dc3  6bdb41           imul bx, bx, 0x41                        
  0dc6  b8042c           mov ax, 0x2c04                           
  0dc9  8ec0             mov es, ax                               
  0dcb  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0dd0  98               cwde                                     
  0dd1  50               push ax                                  
  0dd2  9a6600f930       lcall 0x30f9, 0x66                       -> ovl64:0bf7
  0dd7  83c40c           add sp, 0xc                              
  0dda  a18a44           mov ax, word ptr [0x448a]                
  0ddd  050a00           add ax, 0xa                              
  0de0  50               push ax                                  
  0de1  a18844           mov ax, word ptr [0x4488]                
  0de4  03068c44         add ax, word ptr [0x448c]                
  0de8  05d0ff           add ax, 0xffd0                           
  0deb  50               push ax                                  
  0dec  1e               push ds                                  
  0ded  682a34           push 0x342a                              
  0df0  6a03             push 3                                   
  0df2  8bdf             mov bx, di                               
  0df4  6bdb41           imul bx, bx, 0x41                        
  0df7  b8042c           mov ax, 0x2c04                           
  0dfa  8ec0             mov es, ax                               
  0dfc  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0e01  98               cwde                                     
  0e02  50               push ax                                  
  0e03  9a6600f930       lcall 0x30f9, 0x66                       -> ovl64:0bf7
  0e08  83c40c           add sp, 0xc                              
  0e0b  a14010           mov ax, word ptr [0x1040]                
  0e0e  03069044         add ax, word ptr [0x4490]                
  0e12  8946f2           mov word ptr [bp - 0xe], ax              
  0e15  a14210           mov ax, word ptr [0x1042]                
  0e18  03069244         add ax, word ptr [0x4492]                
  0e1c  8946f4           mov word ptr [bp - 0xc], ax              
  0e1f  66ff76f2         push dword ptr [bp - 0xe]                
  0e23  b83010           mov ax, 0x1030                           
  0e26  8cda             mov dx, ds                               
  0e28  b90800           mov cx, 8                                
  0e2b  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0e30  6a08             push 8                                   
  0e32  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0e37  83c40e           add sp, 0xe                              
  0e3a  8bdf             mov bx, di                               
  0e3c  6bdb41           imul bx, bx, 0x41                        
  0e3f  b8042c           mov ax, 0x2c04                           
  0e42  8ec0             mov es, ax                               
  0e44  26ffb7a715       push word ptr es:[bx + 0x15a7]           
  0e49  1e               push ds                                  
  0e4a  68df10           push 0x10df                              
  0e4d  16               push ss                                  
  0e4e  8d46f6           lea ax, [bp - 0xa]                       
  0e51  50               push ax                                  
  0e52  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0e57  83c40a           add sp, 0xa                              
  0e5a  16               push ss                                  
  0e5b  8d46f6           lea ax, [bp - 0xa]                       
  0e5e  50               push ax                                  
  0e5f  8b46f4           mov ax, word ptr [bp - 0xc]              
  0e62  05fdff           add ax, 0xfffd                           
  0e65  50               push ax                                  
  0e66  8b46f2           mov ax, word ptr [bp - 0xe]              
  0e69  052000           add ax, 0x20                             
  0e6c  50               push ax                                  
  0e6d  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0e72  83c408           add sp, 8                                
  0e75  a14410           mov ax, word ptr [0x1044]                
  0e78  03069044         add ax, word ptr [0x4490]                
  0e7c  8946f2           mov word ptr [bp - 0xe], ax              
  0e7f  66ff76f2         push dword ptr [bp - 0xe]                
  0e83  b83810           mov ax, 0x1038                           
  0e86  8cda             mov dx, ds                               
  0e88  b90800           mov cx, 8                                
  0e8b  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0e90  6a08             push 8                                   
  0e92  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0e97  83c40e           add sp, 0xe                              
  0e9a  8bdf             mov bx, di                               
  0e9c  6bdb41           imul bx, bx, 0x41                        
  0e9f  b8042c           mov ax, 0x2c04                           
  0ea2  8ec0             mov es, ax                               
  0ea4  268a879115       mov al, byte ptr es:[bx + 0x1591]        
  0ea9  98               cwde                                     
  0eaa  50               push ax                                  
  0eab  1e               push ds                                  
  0eac  68e210           push 0x10e2                              
  0eaf  16               push ss                                  
  0eb0  8d46f6           lea ax, [bp - 0xa]                       
  0eb3  50               push ax                                  
  0eb4  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0eb9  83c40a           add sp, 0xa                              
  0ebc  16               push ss                                  
  0ebd  8d46f6           lea ax, [bp - 0xa]                       
  0ec0  50               push ax                                  
  0ec1  8b46f4           mov ax, word ptr [bp - 0xc]              
  0ec4  05fdff           add ax, 0xfffd                           
  0ec7  50               push ax                                  
  0ec8  8b46f2           mov ax, word ptr [bp - 0xe]              
  0ecb  052000           add ax, 0x20                             
  0ece  50               push ax                                  
  0ecf  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0ed4  83c408           add sp, 8                                
  0ed7  c746f00000       mov word ptr [bp - 0x10], 0              
  0edc  e9eb00           jmp 0xfca                                
  0edf  8b5ef0           mov bx, word ptr [bp - 0x10]             
  0ee2  6bdb14           imul bx, bx, 0x14                        
  0ee5  b8042c           mov ax, 0x2c04                           
  0ee8  8ec0             mov es, ax                               
  0eea  268b879301       mov ax, word ptr es:[bx + 0x193]         
  0eef  8bdf             mov bx, di                               
  0ef1  6bdb41           imul bx, bx, 0x41                        
  0ef4  ba042c           mov dx, 0x2c04                           
  0ef7  8ec2             mov es, dx                               
  0ef9  263b877d15       cmp ax, word ptr es:[bx + 0x157d]        
  0efe  7403             je 0xf03                                 
  0f00  e9c400           jmp 0xfc7                                
  0f03  8b5ef0           mov bx, word ptr [bp - 0x10]             
  0f06  6bdb14           imul bx, bx, 0x14                        
  0f09  b8042c           mov ax, 0x2c04                           
  0f0c  8ec0             mov es, ax                               
  0f0e  268b879501       mov ax, word ptr es:[bx + 0x195]         
  0f13  8bdf             mov bx, di                               
  0f15  6bdb41           imul bx, bx, 0x41                        
  0f18  ba042c           mov dx, 0x2c04                           
  0f1b  8ec2             mov es, dx                               
  0f1d  263b877f15       cmp ax, word ptr es:[bx + 0x157f]        
  0f22  7403             je 0xf27                                 
  0f24  e9a000           jmp 0xfc7                                
  0f27  8bdf             mov bx, di                               
  0f29  6bdb41           imul bx, bx, 0x41                        
  0f2c  b8042c           mov ax, 0x2c04                           
  0f2f  8ec0             mov es, ax                               
  0f31  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  0f36  69dbe000         imul bx, bx, 0xe0                        
  0f3a  8bf7             mov si, di                               
  0f3c  6bf641           imul si, si, 0x41                        
  0f3f  b8042c           mov ax, 0x2c04                           
  0f42  8ec0             mov es, ax                               
  0f44  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  0f49  d1e0             shl ax, 1                                
  0f4b  03d8             add bx, ax                               
  0f4d  b81d1e           mov ax, 0x1e1d                           
  0f50  8ec0             mov es, ax                               
  0f52  268a9f0000       mov bl, byte ptr es:[bx]                 
  0f57  81e3ff00         and bx, 0xff                             
  0f5b  b8042c           mov ax, 0x2c04                           
  0f5e  8ec0             mov es, ax                               
  0f60  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  0f66  7444             je 0xfac                                 
  0f68  a18a44           mov ax, word ptr [0x448a]                
  0f6b  050a00           add ax, 0xa                              
  0f6e  50               push ax                                  
  0f6f  a18844           mov ax, word ptr [0x4488]                
  0f72  051000           add ax, 0x10                             
  0f75  50               push ax                                  
  0f76  1e               push ds                                  
  0f77  682a34           push 0x342a                              
  0f7a  6a04             push 4                                   
  0f7c  ff76f0           push word ptr [bp - 0x10]                
  0f7f  9a6600f930       lcall 0x30f9, 0x66                       -> ovl64:0bf7
  0f84  83c40c           add sp, 0xc                              
  0f87  a18a44           mov ax, word ptr [0x448a]                
  0f8a  050a00           add ax, 0xa                              
  0f8d  50               push ax                                  
  0f8e  a18844           mov ax, word ptr [0x4488]                
  0f91  03068c44         add ax, word ptr [0x448c]                
  0f95  05c8ff           add ax, 0xffc8                           
  0f98  50               push ax                                  
  0f99  1e               push ds                                  
  0f9a  682a34           push 0x342a                              
  0f9d  6a04             push 4                                   
  0f9f  ff76f0           push word ptr [bp - 0x10]                
  0fa2  9a6600f930       lcall 0x30f9, 0x66                       -> ovl64:0bf7
  0fa7  83c40c           add sp, 0xc                              
  0faa  eb27             jmp 0xfd3                                
  0fac  a18a44           mov ax, word ptr [0x448a]                
  0faf  052c00           add ax, 0x2c                             
  0fb2  50               push ax                                  
  0fb3  a18c44           mov ax, word ptr [0x448c]                
  0fb6  99               cdq                                      
  0fb7  2bc2             sub ax, dx                               
  0fb9  d1f8             sar ax, 1                                
  0fbb  8b168844         mov dx, word ptr [0x4488]                
  0fbf  03d0             add dx, ax                               
  0fc1  83c2e8           add dx, -0x18                            
  0fc4  52               push dx                                  
  0fc5  ebd2             jmp 0xf99                                
  0fc7  ff46f0           inc word ptr [bp - 0x10]                 
  0fca  837ef008         cmp word ptr [bp - 0x10], 8              
  0fce  7d03             jge 0xfd3                                
  0fd0  e90cff           jmp 0xedf                                
  0fd3  5f               pop di                                   
  0fd4  5e               pop si                                   
  0fd5  c9               leave                                    
  0fd6  cb               retf                                     

ovl46_0fd7:  ; ENTRY
  0fd7  55               push bp                                  
  0fd8  8bec             mov bp, sp                               
  0fda  56               push si                                  
  0fdb  57               push di                                  
  0fdc  8b7e06           mov di, word ptr [bp + 6]                
  0fdf  6a03             push 3                                   
  0fe1  b8042c           mov ax, 0x2c04                           
  0fe4  8ec0             mov es, ax                               
  0fe6  268b1e1001       mov bx, word ptr es:[0x110]              
  0feb  d1e3             shl bx, 1                                
  0fed  b8042c           mov ax, 0x2c04                           
  0ff0  8ec0             mov es, ax                               
  0ff2  26ffb7b000       push word ptr es:[bx + 0xb0]             
  0ff7  b8042c           mov ax, 0x2c04                           
  0ffa  8ec0             mov es, ax                               
  0ffc  268b1e1001       mov bx, word ptr es:[0x110]              
  1001  d1e3             shl bx, 1                                
  1003  b8042c           mov ax, 0x2c04                           
  1006  8ec0             mov es, ax                               
  1008  26ffb7a000       push word ptr es:[bx + 0xa0]             
  100d  6a02             push 2                                   
  100f  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  1014  83c408           add sp, 8                                
  1017  8bc7             mov ax, di                               
  1019  6bc01f           imul ax, ax, 0x1f                        
  101c  051508           add ax, 0x815                            
  101f  68042c           push 0x2c04                              
  1022  50               push ax                                  
  1023  a18a44           mov ax, word ptr [0x448a]                
  1026  050b00           add ax, 0xb                              
  1029  50               push ax                                  
  102a  a18c44           mov ax, word ptr [0x448c]                
  102d  99               cdq                                      
  102e  2bc2             sub ax, dx                               
  1030  d1f8             sar ax, 1                                
  1032  8b168844         mov dx, word ptr [0x4488]                
  1036  03d0             add dx, ax                               
  1038  83c2f8           add dx, -8                               
  103b  52               push dx                                  
  103c  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1041  83c408           add sp, 8                                
  1044  666800000300     push 0x30000                             
  104a  666802000f00     push 0xf0002                             
  1050  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  1055  83c408           add sp, 8                                
  1058  8bdf             mov bx, di                               
  105a  6bdb1f           imul bx, bx, 0x1f                        
  105d  b8042c           mov ax, 0x2c04                           
  1060  8ec0             mov es, ax                               
  1062  2680bf290801     cmp byte ptr es:[bx + 0x829], 1          
  1068  7527             jne 0x1091                               
  106a  1e               push ds                                  
  106b  68e510           push 0x10e5                               ; "Blessings & Quests!"
  106e  a18a44           mov ax, word ptr [0x448a]                
  1071  052300           add ax, 0x23                             
  1074  50               push ax                                  
  1075  a18c44           mov ax, word ptr [0x448c]                
  1078  99               cdq                                      
  1079  2bc2             sub ax, dx                               
  107b  d1f8             sar ax, 1                                
  107d  8b168844         mov dx, word ptr [0x4488]                
  1081  03d0             add dx, ax                               
  1083  83c2f8           add dx, -8                               
  1086  52               push dx                                  
  1087  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  108c  83c408           add sp, 8                                
  108f  eb4c             jmp 0x10dd                               
  1091  8bdf             mov bx, di                               
  1093  6bdb1f           imul bx, bx, 0x1f                        
  1096  b8042c           mov ax, 0x2c04                           
  1099  8ec0             mov es, ax                               
  109b  268b9f1308       mov bx, word ptr es:[bx + 0x813]         
  10a0  69dbe000         imul bx, bx, 0xe0                        
  10a4  8bf7             mov si, di                               
  10a6  6bf61f           imul si, si, 0x1f                        
  10a9  b8042c           mov ax, 0x2c04                           
  10ac  8ec0             mov es, ax                               
  10ae  268b841108       mov ax, word ptr es:[si + 0x811]         
  10b3  d1e0             shl ax, 1                                
  10b5  03d8             add bx, ax                               
  10b7  b81d1e           mov ax, 0x1e1d                           
  10ba  8ec0             mov es, ax                               
  10bc  268a870100       mov al, byte ptr es:[bx + 1]             
  10c1  c1e806           shr ax, 6                                
  10c4  250100           and ax, 1                                
  10c7  0bc0             or ax, ax                                
  10c9  7506             jne 0x10d1                               
  10cb  1e               push ds                                  
  10cc  68f910           push 0x10f9                               ; "Unexplored!"
  10cf  eb9d             jmp 0x106e                               
  10d1  1e               push ds                                  
  10d2  680511           push 0x1105                               ; "Explored!"
  10d5  a18a44           mov ax, word ptr [0x448a]                
  10d8  052100           add ax, 0x21                             
  10db  eb97             jmp 0x1074                               
  10dd  5f               pop di                                   
  10de  5e               pop si                                   
  10df  5d               pop bp                                   
  10e0  cb               retf                                     

ovl46_10e1:  ; ENTRY
  10e1  55               push bp                                  
  10e2  8bec             mov bp, sp                               
  10e4  666800000300     push 0x30000                             
  10ea  666802000700     push 0x70002                             
  10f0  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  10f5  83c408           add sp, 8                                
  10f8  66ff7606         push dword ptr [bp + 6]                  
  10fc  a18a44           mov ax, word ptr [0x448a]                
  10ff  050b00           add ax, 0xb                              
  1102  50               push ax                                  
  1103  a18c44           mov ax, word ptr [0x448c]                
  1106  99               cdq                                      
  1107  2bc2             sub ax, dx                               
  1109  d1f8             sar ax, 1                                
  110b  8b168844         mov dx, word ptr [0x4488]                
  110f  03d0             add dx, ax                               
  1111  83c2f8           add dx, -8                               
  1114  52               push dx                                  
  1115  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  111a  83c408           add sp, 8                                
  111d  666800000300     push 0x30000                             
  1123  666802000f00     push 0xf0002                             
  1129  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  112e  83c408           add sp, 8                                
  1131  66ff760a         push dword ptr [bp + 0xa]                
  1135  a18a44           mov ax, word ptr [0x448a]                
  1138  052300           add ax, 0x23                             
  113b  50               push ax                                  
  113c  a18c44           mov ax, word ptr [0x448c]                
  113f  99               cdq                                      
  1140  2bc2             sub ax, dx                               
  1142  d1f8             sar ax, 1                                
  1144  8b168844         mov dx, word ptr [0x4488]                
  1148  03d0             add dx, ax                               
  114a  83c2f8           add dx, -8                               
  114d  52               push dx                                  
  114e  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1153  83c408           add sp, 8                                
  1156  5d               pop bp                                   
  1157  cb               retf                                     

ovl46_1158:  ; ENTRY
  1158  55               push bp                                  
  1159  8bec             mov bp, sp                               
  115b  666800000300     push 0x30000                             
  1161  666802000700     push 0x70002                             
  1167  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  116c  83c408           add sp, 8                                
  116f  66ff7606         push dword ptr [bp + 6]                  
  1173  a18a44           mov ax, word ptr [0x448a]                
  1176  050b00           add ax, 0xb                              
  1179  50               push ax                                  
  117a  a18c44           mov ax, word ptr [0x448c]                
  117d  99               cdq                                      
  117e  2bc2             sub ax, dx                               
  1180  d1f8             sar ax, 1                                
  1182  8b168844         mov dx, word ptr [0x4488]                
  1186  03d0             add dx, ax                               
  1188  83c2f8           add dx, -8                               
  118b  52               push dx                                  
  118c  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1191  83c408           add sp, 8                                
  1194  666800000300     push 0x30000                             
  119a  666802000f00     push 0xf0002                             
  11a0  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  11a5  83c408           add sp, 8                                
  11a8  66ff760a         push dword ptr [bp + 0xa]                
  11ac  a18a44           mov ax, word ptr [0x448a]                
  11af  052300           add ax, 0x23                             
  11b2  50               push ax                                  
  11b3  a18c44           mov ax, word ptr [0x448c]                
  11b6  99               cdq                                      
  11b7  2bc2             sub ax, dx                               
  11b9  d1f8             sar ax, 1                                
  11bb  8b168844         mov dx, word ptr [0x4488]                
  11bf  03d0             add dx, ax                               
  11c1  83c2f8           add dx, -8                               
  11c4  52               push dx                                  
  11c5  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  11ca  83c408           add sp, 8                                
  11cd  5d               pop bp                                   
  11ce  cb               retf                                     

ovl46_11cf:  ; ENTRY
  11cf  55               push bp                                  
  11d0  8bec             mov bp, sp                               
  11d2  66ff369044       push dword ptr [0x4490]                  
  11d7  1e               push ds                                  
  11d8  682a34           push 0x342a                              
  11db  66ff368c44       push dword ptr [0x448c]                  
  11e0  666a00           push 0                                   
  11e3  1e               push ds                                  
  11e4  689444           push 0x4494                              
  11e7  ff1ed469         lcall [0x69d4]                           
  11eb  83c414           add sp, 0x14                             
  11ee  1e               push ds                                  
  11ef  689444           push 0x4494                              
  11f2  9a75091210       lcall 0x1012, 0x975                      -> 1012:0975
  11f7  83c404           add sp, 4                                
  11fa  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  11ff  5d               pop bp                                   
  1200  cb               retf                                     

ovl46_1201:  ; ENTRY
  1201  55               push bp                                  
  1202  8bec             mov bp, sp                               
  1204  83ec18           sub sp, 0x18                             
  1207  56               push si                                  
  1208  ff760a           push word ptr [bp + 0xa]                 
  120b  ff7608           push word ptr [bp + 8]                   
  120e  ff7606           push word ptr [bp + 6]                   
  1211  16               push ss                                  
  1212  8d46e8           lea ax, [bp - 0x18]                      
  1215  50               push ax                                  
  1216  16               push ss                                  
  1217  8d46f0           lea ax, [bp - 0x10]                      
  121a  50               push ax                                  
  121b  16               push ss                                  
  121c  8d46f8           lea ax, [bp - 8]                         
  121f  50               push ax                                  
  1220  90               nop                                      
  1221  0e               push cs                                  
  1222  e8f500           call 0x131a                              
  1225  83c412           add sp, 0x12                             
  1228  66ff76fc         push dword ptr [bp - 4]                  
  122c  1e               push ds                                  
  122d  689444           push 0x4494                              
  1230  9afe011210       lcall 0x1012, 0x1fe                      -> 1012:01fe
  1235  83c408           add sp, 8                                
  1238  0bc0             or ax, ax                                
  123a  7503             jne 0x123f                               
  123c  e9d800           jmp 0x1317                               
  123f  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  1244  66833e9e4400     cmp dword ptr [0x449e], 0                
  124a  7435             je 0x1281                                
  124c  f706c9440a00     test word ptr [0x44c9], 0xa              
  1252  752d             jne 0x1281                               
  1254  33f6             xor si, si                               
  1256  eb20             jmp 0x1278                               
  1258  8bde             mov bx, si                               
  125a  c1e302           shl bx, 2                                
  125d  66ffb79e44       push dword ptr [bx + 0x449e]             
  1262  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  1267  83c404           add sp, 4                                
  126a  8bde             mov bx, si                               
  126c  c1e302           shl bx, 2                                
  126f  8997b044         mov word ptr [bx + 0x44b0], dx           
  1273  8987ae44         mov word ptr [bx + 0x44ae], ax           
  1277  46               inc si                                   
  1278  a0c844           mov al, byte ptr [0x44c8]                
  127b  b400             mov ah, 0                                
  127d  3bc6             cmp ax, si                               
  127f  7fd7             jg 0x1258                                
  1281  666a00           push 0                                   
  1284  1e               push ds                                  
  1285  689444           push 0x4494                              
  1288  66ff76fc         push dword ptr [bp - 4]                  
  128c  66ff76f8         push dword ptr [bp - 8]                  
  1290  1e               push ds                                  
  1291  682a34           push 0x342a                              
  1294  ff1ed469         lcall [0x69d4]                           
  1298  83c414           add sp, 0x14                             
  129b  66833e9e4400     cmp dword ptr [0x449e], 0                
  12a1  7428             je 0x12cb                                
  12a3  f706c9440a00     test word ptr [0x44c9], 0xa              
  12a9  7520             jne 0x12cb                               
  12ab  33f6             xor si, si                               
  12ad  eb13             jmp 0x12c2                               
  12af  8bde             mov bx, si                               
  12b1  c1e302           shl bx, 2                                
  12b4  66ffb79e44       push dword ptr [bx + 0x449e]             
  12b9  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  12be  83c404           add sp, 4                                
  12c1  46               inc si                                   
  12c2  a0c844           mov al, byte ptr [0x44c8]                
  12c5  b400             mov ah, 0                                
  12c7  3bc6             cmp ax, si                               
  12c9  7fe4             jg 0x12af                                
  12cb  8b46f8           mov ax, word ptr [bp - 8]                
  12ce  a39044           mov word ptr [0x4490], ax                
  12d1  8b46fa           mov ax, word ptr [bp - 6]                
  12d4  a39244           mov word ptr [0x4492], ax                
  12d7  1e               push ds                                  
  12d8  688844           push 0x4488                              
  12db  8d46f8           lea ax, [bp - 8]                         
  12de  16               push ss                                  
  12df  50               push ax                                  
  12e0  b90800           mov cx, 8                                
  12e3  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  12e8  6a1d             push 0x1d                                
  12ea  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  12ef  59               pop cx                                   
  12f0  66ff364810       push dword ptr [0x1048]                  
  12f5  1e               push ds                                  
  12f6  686d54           push 0x546d                              
  12f9  66ff369044       push dword ptr [0x4490]                  
  12fe  1e               push ds                                  
  12ff  682a34           push 0x342a                              
  1302  66ff364c10       push dword ptr [0x104c]                  
  1307  66ff364810       push dword ptr [0x1048]                  
  130c  1e               push ds                                  
  130d  68a854           push 0x54a8                              
  1310  ff1ec869         lcall [0x69c8]                           
  1314  83c41c           add sp, 0x1c                             
  1317  5e               pop si                                   
  1318  c9               leave                                    
  1319  cb               retf                                     

ovl46_131a:  ; ENTRY
  131a  55               push bp                                  
  131b  8bec             mov bp, sp                               
  131d  83ec04           sub sp, 4                                
  1320  56               push si                                  
  1321  57               push di                                  
  1322  8b7612           mov si, word ptr [bp + 0x12]             
  1325  8b7e14           mov di, word ptr [bp + 0x14]             
  1328  c746fe0001       mov word ptr [bp - 2], 0x100             
  132d  c746fc4b00       mov word ptr [bp - 4], 0x4b              
  1332  837e1600         cmp word ptr [bp + 0x16], 0              
  1336  7425             je 0x135d                                
  1338  b8042c           mov ax, 0x2c04                           
  133b  8bd6             mov dx, si                               
  133d  8ec0             mov es, ax                               
  133f  262b167701       sub dx, word ptr es:[0x177]              
  1344  6bd228           imul dx, dx, 0x28                        
  1347  83c224           add dx, 0x24                             
  134a  8bf2             mov si, dx                               
  134c  8bd7             mov dx, di                               
  134e  8ec0             mov es, ax                               
  1350  262b167501       sub dx, word ptr es:[0x175]              
  1355  6bd228           imul dx, dx, 0x28                        
  1358  83c232           add dx, 0x32                             
  135b  8bfa             mov di, dx                               
  135d  83c604           add si, 4                                
  1360  c1fe03           sar si, 3                                
  1363  c1e603           shl si, 3                                
  1366  8b46fe           mov ax, word ptr [bp - 2]                
  1369  99               cdq                                      
  136a  2bc2             sub ax, dx                               
  136c  d1f8             sar ax, 1                                
  136e  3bc6             cmp ax, si                               
  1370  7d04             jge 0x1376                               
  1372  8bc6             mov ax, si                               
  1374  eb08             jmp 0x137e                               
  1376  8b46fe           mov ax, word ptr [bp - 2]                
  1379  99               cdq                                      
  137a  2bc2             sub ax, dx                               
  137c  d1f8             sar ax, 1                                
  137e  8bf0             mov si, ax                               
  1380  8b46fe           mov ax, word ptr [bp - 2]                
  1383  99               cdq                                      
  1384  2bc2             sub ax, dx                               
  1386  d1f8             sar ax, 1                                
  1388  ba8002           mov dx, 0x280                            
  138b  2bd0             sub dx, ax                               
  138d  3bd6             cmp dx, si                               
  138f  7e04             jle 0x1395                               
  1391  8bc6             mov ax, si                               
  1393  eb0f             jmp 0x13a4                               
  1395  8b46fe           mov ax, word ptr [bp - 2]                
  1398  99               cdq                                      
  1399  2bc2             sub ax, dx                               
  139b  d1f8             sar ax, 1                                
  139d  50               push ax                                  
  139e  b88002           mov ax, 0x280                            
  13a1  5a               pop dx                                   
  13a2  2bc2             sub ax, dx                               
  13a4  8bf0             mov si, ax                               
  13a6  8b46fc           mov ax, word ptr [bp - 4]                
  13a9  99               cdq                                      
  13aa  2bc2             sub ax, dx                               
  13ac  d1f8             sar ax, 1                                
  13ae  3bc7             cmp ax, di                               
  13b0  7d04             jge 0x13b6                               
  13b2  8bc7             mov ax, di                               
  13b4  eb08             jmp 0x13be                               
  13b6  8b46fc           mov ax, word ptr [bp - 4]                
  13b9  99               cdq                                      
  13ba  2bc2             sub ax, dx                               
  13bc  d1f8             sar ax, 1                                
  13be  8bf8             mov di, ax                               
  13c0  8b46fc           mov ax, word ptr [bp - 4]                
  13c3  99               cdq                                      
  13c4  2bc2             sub ax, dx                               
  13c6  d1f8             sar ax, 1                                
  13c8  bade01           mov dx, 0x1de                            
  13cb  2bd0             sub dx, ax                               
  13cd  3bd7             cmp dx, di                               
  13cf  7e04             jle 0x13d5                               
  13d1  8bc7             mov ax, di                               
  13d3  eb0f             jmp 0x13e4                               
  13d5  8b46fc           mov ax, word ptr [bp - 4]                
  13d8  99               cdq                                      
  13d9  2bc2             sub ax, dx                               
  13db  d1f8             sar ax, 1                                
  13dd  50               push ax                                  
  13de  b8de01           mov ax, 0x1de                            
  13e1  5a               pop dx                                   
  13e2  2bc2             sub ax, dx                               
  13e4  8bf8             mov di, ax                               
  13e6  8b46fc           mov ax, word ptr [bp - 4]                
  13e9  05feff           add ax, 0xfffe                           
  13ec  50               push ax                                  
  13ed  8b46fe           mov ax, word ptr [bp - 2]                
  13f0  05feff           add ax, 0xfffe                           
  13f3  50               push ax                                  
  13f4  8b46fc           mov ax, word ptr [bp - 4]                
  13f7  99               cdq                                      
  13f8  2bc2             sub ax, dx                               
  13fa  d1f8             sar ax, 1                                
  13fc  8bd7             mov dx, di                               
  13fe  2bd0             sub dx, ax                               
  1400  42               inc dx                                   
  1401  52               push dx                                  
  1402  8b46fe           mov ax, word ptr [bp - 2]                
  1405  99               cdq                                      
  1406  2bc2             sub ax, dx                               
  1408  d1f8             sar ax, 1                                
  140a  8bd6             mov dx, si                               
  140c  2bd0             sub dx, ax                               
  140e  42               inc dx                                   
  140f  52               push dx                                  
  1410  66ff760a         push dword ptr [bp + 0xa]                
  1414  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  1419  83c40c           add sp, 0xc                              
  141c  ff76fc           push word ptr [bp - 4]                   
  141f  ff76fe           push word ptr [bp - 2]                   
  1422  8b46fc           mov ax, word ptr [bp - 4]                
  1425  99               cdq                                      
  1426  2bc2             sub ax, dx                               
  1428  d1f8             sar ax, 1                                
  142a  8bd7             mov dx, di                               
  142c  2bd0             sub dx, ax                               
  142e  52               push dx                                  
  142f  8b46fe           mov ax, word ptr [bp - 2]                
  1432  99               cdq                                      
  1433  2bc2             sub ax, dx                               
  1435  d1f8             sar ax, 1                                
  1437  8bd6             mov dx, si                               
  1439  2bd0             sub dx, ax                               
  143b  52               push dx                                  
  143c  66ff7606         push dword ptr [bp + 6]                  
  1440  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  1445  83c40c           add sp, 0xc                              
  1448  8b46fc           mov ax, word ptr [bp - 4]                
  144b  05f6ff           add ax, 0xfff6                           
  144e  50               push ax                                  
  144f  8b46fe           mov ax, word ptr [bp - 2]                
  1452  05f6ff           add ax, 0xfff6                           
  1455  50               push ax                                  
  1456  8b46fc           mov ax, word ptr [bp - 4]                
  1459  99               cdq                                      
  145a  2bc2             sub ax, dx                               
  145c  d1f8             sar ax, 1                                
  145e  8bd7             mov dx, di                               
  1460  2bd0             sub dx, ax                               
  1462  83c205           add dx, 5                                
  1465  52               push dx                                  
  1466  8b46fe           mov ax, word ptr [bp - 2]                
  1469  99               cdq                                      
  146a  2bc2             sub ax, dx                               
  146c  d1f8             sar ax, 1                                
  146e  8bd6             mov dx, si                               
  1470  2bd0             sub dx, ax                               
  1472  83c205           add dx, 5                                
  1475  52               push dx                                  
  1476  66ff760e         push dword ptr [bp + 0xe]                
  147a  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  147f  83c40c           add sp, 0xc                              
  1482  5f               pop di                                   
  1483  5e               pop si                                   
  1484  c9               leave                                    
  1485  cb               retf                                     

ovl46_1486:  ; ENTRY
  1486  55               push bp                                  
  1487  8bec             mov bp, sp                               
  1489  56               push si                                  
  148a  57               push di                                  
  148b  8b5e0a           mov bx, word ptr [bp + 0xa]              
  148e  8b4e0c           mov cx, word ptr [bp + 0xc]              
  1491  bef000           mov si, 0xf0                             
  1494  bf8000           mov di, 0x80                             
  1497  83c304           add bx, 4                                
  149a  c1fb03           sar bx, 3                                
  149d  c1e303           shl bx, 3                                
  14a0  8bc6             mov ax, si                               
  14a2  99               cdq                                      
  14a3  2bc2             sub ax, dx                               
  14a5  d1f8             sar ax, 1                                
  14a7  3bc3             cmp ax, bx                               
  14a9  7d04             jge 0x14af                               
  14ab  8bc3             mov ax, bx                               
  14ad  eb07             jmp 0x14b6                               
  14af  8bc6             mov ax, si                               
  14b1  99               cdq                                      
  14b2  2bc2             sub ax, dx                               
  14b4  d1f8             sar ax, 1                                
  14b6  8bd8             mov bx, ax                               
  14b8  8bc6             mov ax, si                               
  14ba  99               cdq                                      
  14bb  2bc2             sub ax, dx                               
  14bd  d1f8             sar ax, 1                                
  14bf  ba8002           mov dx, 0x280                            
  14c2  2bd0             sub dx, ax                               
  14c4  3bd3             cmp dx, bx                               
  14c6  7e04             jle 0x14cc                               
  14c8  8bc3             mov ax, bx                               
  14ca  eb0e             jmp 0x14da                               
  14cc  8bc6             mov ax, si                               
  14ce  99               cdq                                      
  14cf  2bc2             sub ax, dx                               
  14d1  d1f8             sar ax, 1                                
  14d3  50               push ax                                  
  14d4  b88002           mov ax, 0x280                            
  14d7  5a               pop dx                                   
  14d8  2bc2             sub ax, dx                               
  14da  8bd8             mov bx, ax                               
  14dc  8bc7             mov ax, di                               
  14de  99               cdq                                      
  14df  2bc2             sub ax, dx                               
  14e1  d1f8             sar ax, 1                                
  14e3  3bc1             cmp ax, cx                               
  14e5  7d04             jge 0x14eb                               
  14e7  8bc1             mov ax, cx                               
  14e9  eb07             jmp 0x14f2                               
  14eb  8bc7             mov ax, di                               
  14ed  99               cdq                                      
  14ee  2bc2             sub ax, dx                               
  14f0  d1f8             sar ax, 1                                
  14f2  8bc8             mov cx, ax                               
  14f4  8bc7             mov ax, di                               
  14f6  99               cdq                                      
  14f7  2bc2             sub ax, dx                               
  14f9  d1f8             sar ax, 1                                
  14fb  bade01           mov dx, 0x1de                            
  14fe  2bd0             sub dx, ax                               
  1500  3bd1             cmp dx, cx                               
  1502  7e04             jle 0x1508                               
  1504  8bc1             mov ax, cx                               
  1506  eb0e             jmp 0x1516                               
  1508  8bc7             mov ax, di                               
  150a  99               cdq                                      
  150b  2bc2             sub ax, dx                               
  150d  d1f8             sar ax, 1                                
  150f  50               push ax                                  
  1510  b8de01           mov ax, 0x1de                            
  1513  5a               pop dx                                   
  1514  2bc2             sub ax, dx                               
  1516  8bc8             mov cx, ax                               
  1518  57               push di                                  
  1519  56               push si                                  
  151a  8bc7             mov ax, di                               
  151c  99               cdq                                      
  151d  2bc2             sub ax, dx                               
  151f  d1f8             sar ax, 1                                
  1521  8bd1             mov dx, cx                               
  1523  2bd0             sub dx, ax                               
  1525  52               push dx                                  
  1526  8bc6             mov ax, si                               
  1528  99               cdq                                      
  1529  2bc2             sub ax, dx                               
  152b  d1f8             sar ax, 1                                
  152d  8bd3             mov dx, bx                               
  152f  2bd0             sub dx, ax                               
  1531  52               push dx                                  
  1532  66ff7606         push dword ptr [bp + 6]                  
  1536  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  153b  83c40c           add sp, 0xc                              
  153e  5f               pop di                                   
  153f  5e               pop si                                   
  1540  5d               pop bp                                   
  1541  cb               retf                                     
