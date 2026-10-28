; res_197c file_off 0x1b7c0
  0000  35c268           xor ax, 0x68c2                           
  0003  21a2da0f         and word ptr [bp + si + 0xfda], sp       
  0007  c9               leave                                    
  0008  fe               db fe                                    
  0009  3f               aas                                      
  000a  35c268           xor ax, 0x68c2                           
  000d  21a2da0f         and word ptr [bp + si + 0xfda], sp       
  0011  c9               leave                                    
  0012  ff               db ff                                    
  0013  3f               aas                                      
  0014  0042c0           add byte ptr [bp + si - 0x40], al        
  0017  ff00             inc word ptr [bx + si]                   
  0019  48               dec ax                                   
  001a  c0ff00           sar bh, 0                                
  001d  4a               dec dx                                   
  001e  c0ff00           sar bh, 0                                
  0021  0000             add byte ptr [bx + si], al               
  0023  3f               aas                                      
  0024  8564de           test word ptr [si - 0x22], sp            
  0027  f9               stc                                      
  0028  33f3             xor si, bx                               
  002a  04b5             add al, 0xb5                             
  002c  ff               db ff                                    
  002d  3f               aas                                      
  002e  0000             add byte ptr [bx + si], al               
  0030  807fb100         cmp byte ptr [bx - 0x4f], 0              
  0034  eb06             jmp 0x3c                                 
  0036  b102             mov cl, 2                                
  0038  eb02             jmp 0x3c                                 
  003a  b104             mov cl, 4                                
  003c  9b               wait                                     
  003d  d9e5             fxam                                     
  003f  55               push bp                                  
  0040  8bec             mov bp, sp                               
  0042  8d66fe           lea sp, [bp - 2]                         
  0045  9b               wait                                     
  0046  dd7efe           fnstsw word ptr [bp - 2]                 
  0049  9b               wait                                     
  004a  8a66ff           mov ah, byte ptr [bp - 1]                
  004d  9e               sahf                                     
  004e  720f             jb 0x5f                                  
  0050  752e             jne 0x80                                 
  0052  80f902           cmp cl, 2                                
  0055  7506             jne 0x5d                                 
  0057  9b               wait                                     
  0058  ddd8             fstp st(0)                               
  005a  9b               wait                                     
  005b  d9e8             fld1                                     
  005d  eb1e             jmp 0x7d                                 
  005f  740e             je 0x6f                                  
  0061  7b0c             jnp 0x6f                                 
  0063  9b               wait                                     
  0064  ddd8             fstp st(0)                               
  0066  9b               wait                                     
  0067  2ed9061400       fld dword ptr cs:[0x14]                  
  006c  9b               wait                                     
  006d  d9e4             ftst                                     
  006f  eb0c             jmp 0x7d                                 
  0071  9b               wait                                     
  0072  ded9             fcompp                                   
  0074  9b               wait                                     
  0075  2ed9061400       fld dword ptr cs:[0x14]                  
  007a  9b               wait                                     
  007b  d9e4             ftst                                     
  007d  e9a700           jmp 0x127                                
  0080  9b               wait                                     
  0081  d9e1             fabs                                     
  0083  9b               wait                                     
  0084  2edb2e0000       fld xword ptr cs:[0]                     
  0089  9b               wait                                     
  008a  d9c9             fxch st(1)                               
  008c  9b               wait                                     
  008d  d9f8             fprem                                    
  008f  b502             mov ch, 2                                
  0091  22ec             and ch, ah                               
  0093  d0ed             shr ch, 1                                
  0095  9b               wait                                     
  0096  dd7efe           fnstsw word ptr [bp - 2]                 
  0099  9b               wait                                     
  009a  8a66ff           mov ah, byte ptr [bp - 1]                
  009d  9e               sahf                                     
  009e  7ad1             jp 0x71                                  
  00a0  b003             mov al, 3                                
  00a2  22c4             and al, ah                               
  00a4  d0e4             shl ah, 1                                
  00a6  d0e4             shl ah, 1                                
  00a8  d0d0             rcl al, 1                                
  00aa  04fc             add al, 0xfc                             
  00ac  d0d0             rcl al, 1                                
  00ae  80f902           cmp cl, 2                                
  00b1  7504             jne 0xb7                                 
  00b3  02c1             add al, cl                               
  00b5  b500             mov ch, 0                                
  00b7  2407             and al, 7                                
  00b9  a801             test al, 1                               
  00bb  7405             je 0xc2                                  
  00bd  9b               wait                                     
  00be  dee9             fsubp st(1)                              
  00c0  eb03             jmp 0xc5                                 
  00c2  9b               wait                                     
  00c3  ddd9             fstp st(1)                               
  00c5  9b               wait                                     
  00c6  d9f2             fptan                                    
  00c8  80f904           cmp cl, 4                                
  00cb  7429             je 0xf6                                  
  00cd  a803             test al, 3                               
  00cf  7a03             jp 0xd4                                  
  00d1  9b               wait                                     
  00d2  d9c9             fxch st(1)                               
  00d4  9b               wait                                     
  00d5  d9c1             fld st(1)                                
  00d7  9b               wait                                     
  00d8  d8c8             fmul st(0)                               
  00da  9b               wait                                     
  00db  d9c9             fxch st(1)                               
  00dd  9b               wait                                     
  00de  d8c8             fmul st(0)                               
  00e0  9b               wait                                     
  00e1  dec1             faddp st(1)                              
  00e3  9b               wait                                     
  00e4  d9fa             fsqrt                                    
  00e6  d0e8             shr al, 1                                
  00e8  d0e8             shr al, 1                                
  00ea  32c5             xor al, ch                               
  00ec  7403             je 0xf1                                  
  00ee  9b               wait                                     
  00ef  d9e0             fchs                                     
  00f1  9b               wait                                     
  00f2  def9             fdivp st(1)                              
  00f4  eb31             jmp 0x127                                
  00f6  8ae0             mov ah, al                               
  00f8  d0ec             shr ah, 1                                
  00fa  80e401           and ah, 1                                
  00fd  32e5             xor ah, ch                               
  00ff  7403             je 0x104                                 
  0101  9b               wait                                     
  0102  d9e0             fchs                                     
  0104  a803             test al, 3                               
  0106  7a1c             jp 0x124                                 
  0108  9b               wait                                     
  0109  d9c9             fxch st(1)                               
  010b  9b               wait                                     
  010c  d9e4             ftst                                     
  010e  9b               wait                                     
  010f  dd7efe           fnstsw word ptr [bp - 2]                 
  0112  9b               wait                                     
  0113  f646ff40         test byte ptr [bp - 1], 0x40             
  0117  740b             je 0x124                                 
  0119  9b               wait                                     
  011a  ded9             fcompp                                   
  011c  9b               wait                                     
  011d  2ed9062e00       fld dword ptr cs:[0x2e]                  
  0122  eb03             jmp 0x127                                
  0124  9b               wait                                     
  0125  def9             fdivp st(1)                              
  0127  8be5             mov sp, bp                               
  0129  5d               pop bp                                   
  012a  c3               ret                                      
  012b  9b               wait                                     
  012c  d9e5             fxam                                     
  012e  55               push bp                                  
  012f  8bec             mov bp, sp                               
  0131  8d66fe           lea sp, [bp - 2]                         
  0134  9b               wait                                     
  0135  dd7efe           fnstsw word ptr [bp - 2]                 
  0138  9b               wait                                     
  0139  8a66ff           mov ah, byte ptr [bp - 1]                
  013c  9e               sahf                                     
  013d  91               xchg cx, ax                              
  013e  7204             jb 0x144                                 
  0140  751c             jne 0x15e                                
  0142  eb4c             jmp 0x190                                
  0144  744a             je 0x190                                 
  0146  7b48             jnp 0x190                                
  0148  9b               wait                                     
  0149  ddd8             fstp st(0)                               
  014b  9b               wait                                     
  014c  2edb2e0a00       fld xword ptr cs:[0xa]                   
  0151  eb35             jmp 0x188                                
  0153  9b               wait                                     
  0154  ded9             fcompp                                   
  0156  9b               wait                                     
  0157  2edb2e0000       fld xword ptr cs:[0]                     
  015c  eb2a             jmp 0x188                                
  015e  9b               wait                                     
  015f  d9e1             fabs                                     
  0161  9b               wait                                     
  0162  d9e8             fld1                                     
  0164  9b               wait                                     
  0165  d8d1             fcom st(1)                               
  0167  9b               wait                                     
  0168  dd7efe           fnstsw word ptr [bp - 2]                 
  016b  9b               wait                                     
  016c  8a66ff           mov ah, byte ptr [bp - 1]                
  016f  9e               sahf                                     
  0170  74e1             je 0x153                                 
  0172  7303             jae 0x177                                
  0174  9b               wait                                     
  0175  d9c9             fxch st(1)                               
  0177  9b               wait                                     
  0178  d9f3             fpatan                                   
  017a  730c             jae 0x188                                
  017c  9b               wait                                     
  017d  2edb2e0a00       fld xword ptr cs:[0xa]                   
  0182  9b               wait                                     
  0183  dee9             fsubp st(1)                              
  0185  80f502           xor ch, 2                                
  0188  f6c502           test ch, 2                               
  018b  7403             je 0x190                                 
  018d  9b               wait                                     
  018e  d9e0             fchs                                     
  0190  8be5             mov sp, bp                               
  0192  5d               pop bp                                   
  0193  c3               ret                                      
  0194  9b               wait                                     
  0195  d9e8             fld1                                     
  0197  eb08             jmp 0x1a1                                
  0199  9b               wait                                     
  019a  d9ec             fldlg2                                   
  019c  eb03             jmp 0x1a1                                
  019e  9b               wait                                     
  019f  d9ed             fldln2                                   
  01a1  9b               wait                                     
  01a2  d9c9             fxch st(1)                               
  01a4  55               push bp                                  
  01a5  8bec             mov bp, sp                               
  01a7  9b               wait                                     
  01a8  d9e5             fxam                                     
  01aa  8d66f6           lea sp, [bp - 0xa]                       
  01ad  9b               wait                                     
  01ae  dd7ef6           fnstsw word ptr [bp - 0xa]               
  01b1  9b               wait                                     
  01b2  8a66f7           mov ah, byte ptr [bp - 9]                
  01b5  9e               sahf                                     
  01b6  720c             jb 0x1c4                                 
  01b8  7405             je 0x1bf                                 
  01ba  f6c402           test ah, 2                               
  01bd  7422             je 0x1e1                                 
  01bf  9b               wait                                     
  01c0  ddd8             fstp st(0)                               
  01c2  eb0f             jmp 0x1d3                                
  01c4  7416             je 0x1dc                                 
  01c6  9b               wait                                     
  01c7  ddd9             fstp st(1)                               
  01c9  7b11             jnp 0x1dc                                
  01cb  9b               wait                                     
  01cc  ddd9             fstp st(1)                               
  01ce  f6c402           test ah, 2                               
  01d1  7432             je 0x205                                 
  01d3  9b               wait                                     
  01d4  ddd8             fstp st(0)                               
  01d6  9b               wait                                     
  01d7  2ed9061800       fld dword ptr cs:[0x18]                  
  01dc  9b               wait                                     
  01dd  d9e4             ftst                                     
  01df  eb24             jmp 0x205                                
  01e1  9b               wait                                     
  01e2  d9c0             fld st(0)                                
  01e4  9b               wait                                     
  01e5  db7ef6           fstp xword ptr [bp - 0xa]                
  01e8  9b               wait                                     
  01e9  817efeff3f       cmp word ptr [bp - 2], 0x3fff            
  01ee  7512             jne 0x202                                
  01f0  817efc0080       cmp word ptr [bp - 4], 0x8000            
  01f5  750b             jne 0x202                                
  01f7  9b               wait                                     
  01f8  d9e8             fld1                                     
  01fa  9b               wait                                     
  01fb  dee9             fsubp st(1)                              
  01fd  9b               wait                                     
  01fe  d9f9             fyl2xp1                                  
  0200  eb03             jmp 0x205                                
  0202  9b               wait                                     
  0203  d9f1             fyl2x                                    
  0205  8be5             mov sp, bp                               
  0207  5d               pop bp                                   
  0208  c3               ret                                      
  0209  2bc9             sub cx, cx                               
  020b  eb12             jmp 0x21f                                
  020d  9b               wait                                     
  020e  d9e9             fldl2t                                   
  0210  b101             mov cl, 1                                
  0212  9b               wait                                     
  0213  d9c9             fxch st(1)                               
  0215  eb08             jmp 0x21f                                
  0217  9b               wait                                     
  0218  d9ea             fldl2e                                   
  021a  b101             mov cl, 1                                
  021c  9b               wait                                     
  021d  d9c9             fxch st(1)                               
  021f  9b               wait                                     
  0220  d9e5             fxam                                     
  0222  55               push bp                                  
  0223  8bec             mov bp, sp                               
  0225  8d66fc           lea sp, [bp - 4]                         
  0228  9b               wait                                     
  0229  dd7efc           fnstsw word ptr [bp - 4]                 
  022c  e303             jcxz 0x231                               
  022e  9b               wait                                     
  022f  d9c9             fxch st(1)                               
  0231  9b               wait                                     
  0232  8a66fd           mov ah, byte ptr [bp - 3]                
  0235  9e               sahf                                     
  0236  7210             jb 0x248                                 
  0238  7529             jne 0x263                                
  023a  9b               wait                                     
  023b  ddd8             fstp st(0)                               
  023d  e303             jcxz 0x242                                ; "ERROR - (%d, %d) (%d, %d) %d %d"
  023f  9b               wait                                     
  0240  ddd8             fstp st(0)                               
  0242  9b               wait                                     
  0243  d9e8             fld1                                     
  0245  e9a400           jmp 0x2ec                                
  0248  e303             jcxz 0x24d                               
  024a  9b               wait                                     
  024b  ddd8             fstp st(0)                               
  024d  740e             je 0x25d                                 
  024f  7b0c             jnp 0x25d                                
  0251  9b               wait                                     
  0252  ddd8             fstp st(0)                               
  0254  9b               wait                                     
  0255  2ed9062e00       fld dword ptr cs:[0x2e]                  
  025a  e98400           jmp 0x2e1                                
  025d  9b               wait                                     
  025e  d9e4             ftst                                     
  0260  e98900           jmp 0x2ec                                
  0263  e303             jcxz 0x268                               
  0265  9b               wait                                     
  0266  dec9             fmulp st(1)                              
  0268  9b               wait                                     
  0269  d9e1             fabs                                     
  026b  9b               wait                                     
  026c  2ed8162000       fcom dword ptr cs:[0x20]                 
  0271  9b               wait                                     
  0272  dd7efc           fnstsw word ptr [bp - 4]                 
  0275  9b               wait                                     
  0276  f646fd41         test byte ptr [bp - 3], 0x41             
  027a  740b             je 0x287                                 
  027c  9b               wait                                     
  027d  d9f0             f2xm1                                    
  027f  9b               wait                                     
  0280  d9e8             fld1                                     
  0282  9b               wait                                     
  0283  dec1             faddp st(1)                              
  0285  eb5a             jmp 0x2e1                                
  0287  9b               wait                                     
  0288  d9e8             fld1                                     
  028a  9b               wait                                     
  028b  d9c1             fld st(1)                                
  028d  9b               wait                                     
  028e  d97efc           fnstcw word ptr [bp - 4]                 
  0291  9b               wait                                     
  0292  d9fd             fscale                                   
  0294  804efd0f         or byte ptr [bp - 3], 0xf                
  0298  9b               wait                                     
  0299  d96efc           fldcw word ptr [bp - 4]                  
  029c  9b               wait                                     
  029d  d9fc             frndint                                  
  029f  8066fdf3         and byte ptr [bp - 3], 0xf3              
  02a3  9b               wait                                     
  02a4  d96efc           fldcw word ptr [bp - 4]                  
  02a7  9b               wait                                     
  02a8  df56fe           fist word ptr [bp - 2]                   
  02ab  9b               wait                                     
  02ac  d9c9             fxch st(1)                               
  02ae  9b               wait                                     
  02af  d9e0             fchs                                     
  02b1  9b               wait                                     
  02b2  d9c9             fxch st(1)                               
  02b4  9b               wait                                     
  02b5  d9fd             fscale                                   
  02b7  9b               wait                                     
  02b8  ddd9             fstp st(1)                               
  02ba  9b               wait                                     
  02bb  dee9             fsubp st(1)                              
  02bd  9b               wait                                     
  02be  d9f0             f2xm1                                    
  02c0  9b               wait                                     
  02c1  d9e8             fld1                                     
  02c3  9b               wait                                     
  02c4  dec1             faddp st(1)                              
  02c6  d16efe           shr word ptr [bp - 2], 1                 
  02c9  7309             jae 0x2d4                                
  02cb  9b               wait                                     
  02cc  2edb2e2400       fld xword ptr cs:[0x24]                  
  02d1  9b               wait                                     
  02d2  dec9             fmulp st(1)                              
  02d4  9b               wait                                     
  02d5  df46fe           fild word ptr [bp - 2]                   
  02d8  9b               wait                                     
  02d9  d9c9             fxch st(1)                               
  02db  9b               wait                                     
  02dc  d9fd             fscale                                   
  02de  9b               wait                                     
  02df  ddd9             fstp st(1)                               
  02e1  f6c402           test ah, 2                               
  02e4  7406             je 0x2ec                                 
  02e6  9b               wait                                     
  02e7  d9e8             fld1                                     
  02e9  9b               wait                                     
  02ea  def1             fdivrp st(1)                             
  02ec  8be5             mov sp, bp                               
  02ee  5d               pop bp                                   
  02ef  c3               ret                                      

res_197c_02f0:  ; ENTRY
  02f0  53               push bx                                  
  02f1  36a00700         mov al, byte ptr ss:[7]                  
  02f5  8cdb             mov bx, ds                               
  02f7  80e3f8           and bl, 0xf8                             
  02fa  1e               push ds                                  
  02fb  368e1e0a00       mov ds, word ptr ss:[0xa]                
  0300  304705           xor byte ptr [bx + 5], al                
  0303  1f               pop ds                                   
  0304  5b               pop bx                                   
  0305  c3               ret                                      
  0306  55               push bp                                  
  0307  8bec             mov bp, sp                               
  0309  50               push ax                                  
  030a  56               push si                                  
  030b  1e               push ds                                  
  030c  f6460702         test byte ptr [bp + 7], 2                
  0310  7401             je 0x313                                 
  0312  fb               sti                                      
  0313  c57602           lds si, ptr [bp + 2]                     
  0316  e8d7ff           call 0x2f0                               
  0319  8b44ff           mov ax, word ptr [si - 1]                
  031c  2c34             sub al, 0x34                             
  031e  3c08             cmp al, 8                                
  0320  7355             jae 0x377                                
  0322  3d03e3           cmp ax, 0xe303                           
  0325  7425             je 0x34c                                 
  0327  3d07e0           cmp ax, 0xe007                           
  032a  7511             jne 0x33d                                
  032c  36803e060002     cmp byte ptr ss:[6], 2                   
  0332  7d09             jge 0x33d                                
  0334  9b               wait                                     
  0335  dd7efe           fnstsw word ptr [bp - 2]                 
  0338  ff4602           inc word ptr [bp + 2]                    
  033b  eb5d             jmp 0x39a                                
  033d  83ee02           sub si, 2                                
  0340  c6049b           mov byte ptr [si], 0x9b                  
  0343  804401a4         add byte ptr [si + 1], 0xa4              
  0347  897602           mov word ptr [bp + 2], si                
  034a  eb4e             jmp 0x39a                                
  034c  dbe3             fninit                                   
  034e  ff4602           inc word ptr [bp + 2]                    
  0351  36c70600000041   mov word ptr ss:[0], 0x4100              
  0358  36c70602003f00   mov word ptr ss:[2], 0x3f                
  035f  36c70624000000   mov word ptr ss:[0x24], 0                
  0366  36a11000         mov ax, word ptr ss:[0x10]               
  036a  36a30c00         mov word ptr ss:[0xc], ax                
  036e  36c70604000000   mov word ptr ss:[4], 0                   
  0375  eb23             jmp 0x39a                                
  0377  7729             ja 0x3a2                                 
  0379  f6c420           test ah, 0x20                            
  037c  7531             jne 0x3af                                
  037e  83ee02           sub si, 2                                
  0381  897602           mov word ptr [bp + 2], si                
  0384  c6049b           mov byte ptr [si], 0x9b                  
  0387  46               inc si                                   
  0388  8ac4             mov al, ah                               
  038a  25c007           and ax, 0x7c0                            
  038d  d0e8             shr al, 1                                
  038f  d0e8             shr al, 1                                
  0391  d0e8             shr al, 1                                
  0393  3418             xor al, 0x18                             
  0395  0526d8           add ax, 0xd826                           
  0398  8904             mov word ptr [si], ax                    
  039a  e853ff           call 0x2f0                               
  039d  1f               pop ds                                   
  039e  5e               pop si                                   
  039f  58               pop ax                                   
  03a0  5d               pop bp                                   
  03a1  cf               iret                                     
  03a2  3c09             cmp al, 9                                
  03a4  7709             ja 0x3af                                 
  03a6  83ee02           sub si, 2                                
  03a9  c704909b         mov word ptr [si], 0x9b90                
  03ad  eb98             jmp 0x347                                
  03af  cc               int3                                     
  03b0  ebe8             jmp 0x39a                                
  03b2  3200             xor al, byte ptr [bx + si]               
  03b4  36003a           add byte ptr ss:[bp + si], bh            
  03b7  002b             add byte ptr [bp + di], ch               
  03b9  019e0194         add word ptr [bp - 0x6bff], bx           
  03bd  01990117         add word ptr [bx + di + 0x1701], bx      
  03c1  0209             add cl, byte ptr [bx + di]               
  03c3  020d             add cl, byte ptr [di]                    
  03c5  02fb             add bh, bl                               
  03c7  50               push ax                                  
  03c8  56               push si                                  
  03c9  06               push es                                  
  03ca  55               push bp                                  
  03cb  8bec             mov bp, sp                               
  03cd  c47608           les si, ptr [bp + 8]                     
  03d0  26ac             lodsb al, byte ptr es:[si]               
  03d2  897608           mov word ptr [bp + 8], si                
  03d5  98               cwde                                     
  03d6  96               xchg si, ax                              
  03d7  51               push cx                                  
  03d8  2eff94c603       call word ptr cs:[si + 0x3c6]            
  03dd  59               pop cx                                   
  03de  5d               pop bp                                   
  03df  07               pop es                                   
  03e0  5e               pop si                                   
  03e1  58               pop ax                                   
  03e2  cf               iret                                     
  03e3  0000             add byte ptr [bx + si], al               
  03e5  0000             add byte ptr [bx + si], al               
  03e7  0000             add byte ptr [bx + si], al               
  03e9  0000             add byte ptr [bx + si], al               
  03eb  0000             add byte ptr [bx + si], al               
  03ed  0000             add byte ptr [bx + si], al               
  03ef  005f07           add byte ptr [bx + 7], bl                
  03f2  5a               pop dx                                   
  03f3  59               pop cx                                   
  03f4  5b               pop bx                                   
  03f5  5e               pop si                                   
  03f6  1f               pop ds                                   
  03f7  f8               clc                                      
  03f8  cb               retf                                     
  03f9  a00200           mov al, byte ptr [2]                     
  03fc  8a260000         mov ah, byte ptr [0]                     
  0400  cd37             int 0x37                                 
  0402  e2f6             loop 0x3fa                               
  0404  c48074e8         les ax, ptr [bx + si - 0x178c]           
  0408  f6d0             not al                                   
  040a  22c4             and al, ah                               
  040c  e92901           jmp 0x538                                
  040f  c47c06           les di, ptr [si + 6]                     
  0412  f6c308           test bl, 8                               
  0415  7508             jne 0x41f                                
  0417  8cc3             mov bx, es                               
  0419  81e300f0         and bx, 0xf000                           
  041d  8ec3             mov es, bx                               
  041f  26f60580         test byte ptr es:[di], 0x80              
  0423  7501             jne 0x426                                
  0425  47               inc di                                   
  0426  268b1d           mov bx, word ptr es:[di]                 
  0429  86fb             xchg bl, bh                              
  042b  eb45             jmp 0x472                                
  042d  eb55             jmp 0x484                                
  042f  90               nop                                      

res_197c_0430:  ; ENTRY
  0430  1e               push ds                                  
  0431  56               push si                                  
  0432  53               push bx                                  
  0433  51               push cx                                  
  0434  52               push dx                                  
  0435  06               push es                                  
  0436  57               push di                                  
  0437  8ed8             mov ds, ax                               
  0439  a00600           mov al, byte ptr [6]                     
  043c  0ac0             or al, al                                
  043e  8bd8             mov bx, ax                               
  0440  74b7             je 0x3f9                                 
  0442  be1200           mov si, 0x12                             
  0445  d934             fnstenv [si]                             
  0447  9b               wait                                     
  0448  8b4402           mov ax, word ptr [si + 2]                
  044b  a880             test al, 0x80                            
  044d  74a1             je 0x3f0                                 
  044f  9b               wait                                     
  0450  dbe2             fnclex                                   
  0452  8bd0             mov dx, ax                               
  0454  8a04             mov al, byte ptr [si]                    
  0456  8af2             mov dh, dl                               
  0458  0c40             or al, 0x40                              
  045a  22d0             and dl, al                               
  045c  80e27f           and dl, 0x7f                             
  045f  885402           mov byte ptr [si + 2], dl                
  0462  9b               wait                                     
  0463  d924             fldenv [si]                              
  0465  f6d0             not al                                   
  0467  22c6             and al, dh                               
  0469  0a1e0700         or bl, byte ptr [7]                      
  046d  80fb03           cmp bl, 3                                
  0470  7d9d             jge 0x40f                                
  0472  80e707           and bh, 7                                
  0475  8af3             mov dh, bl                               
  0477  80e6c0           and dh, 0xc0                             
  047a  80fec0           cmp dh, 0xc0                             
  047d  7403             je 0x482                                 
  047f  80e338           and bl, 0x38                             
  0482  9b               wait                                     
  0483  fb               sti                                      
  0484  a802             test al, 2                               
  0486  7455             je 0x4dd                                 
  0488  b90800           mov cx, 8                                
  048b  e8bd00           call 0x54b                               
  048e  9b               wait                                     
  048f  d9f7             fincstp                                  
  0491  e2f8             loop 0x48b                               
  0493  8bc3             mov ax, bx                               
  0495  d1e8             shr ax, 1                                
  0497  249c             and al, 0x9c                             
  0499  3c80             cmp al, 0x80                             
  049b  7408             je 0x4a5                                 
  049d  3c94             cmp al, 0x94                             
  049f  7404             je 0x4a5                                 
  04a1  2498             and al, 0x98                             
  04a3  3c08             cmp al, 8                                
  04a5  7434             je 0x4db                                 
  04a7  d93e3000         fnstcw word ptr [0x30]                   
  04ab  9b               wait                                     
  04ac  800e300002       or byte ptr [0x30], 2                    
  04b1  9b               wait                                     
  04b2  d92e3000         fldcw word ptr [0x30]                    
  04b6  c47c0a           les di, ptr [si + 0xa]                   
  04b9  83fb30           cmp bx, 0x30                             
  04bc  7506             jne 0x4c4                                
  04be  9b               wait                                     
  04bf  26d905           fld dword ptr es:[di]                    
  04c2  eb0a             jmp 0x4ce                                
  04c4  81fb3004         cmp bx, 0x430                            
  04c8  750a             jne 0x4d4                                
  04ca  9b               wait                                     
  04cb  26dd05           fld qword ptr es:[di]                    
  04ce  e87a00           call 0x54b                               
  04d1  bbf9de           mov bx, 0xdef9                           
  04d4  9b               wait                                     
  04d5  8b3e0c00         mov di, word ptr [0xc]                   
  04d9  eb33             jmp 0x50e                                
  04db  eb49             jmp 0x526                                
  04dd  8a260200         mov ah, byte ptr [2]                     
  04e1  f6d4             not ah                                   
  04e3  22e0             and ah, al                               
  04e5  80e47f           and ah, 0x7f                             
  04e8  754e             jne 0x538                                
  04ea  a805             test al, 5                               
  04ec  750e             jne 0x4fc                                
  04ee  a818             test al, 0x18                            
  04f0  7438             je 0x52a                                 
  04f2  8bc3             mov ax, bx                               
  04f4  d1e8             shr ax, 1                                
  04f6  24e8             and al, 0xe8                             
  04f8  3c88             cmp al, 0x88                             
  04fa  752e             jne 0x52a                                
  04fc  d93e3000         fnstcw word ptr [0x30]                   
  0500  9b               wait                                     
  0501  a13000           mov ax, word ptr [0x30]                  
  0504  800e30003f       or byte ptr [0x30], 0x3f                 
  0509  9b               wait                                     
  050a  d92e3000         fldcw word ptr [0x30]                    
  050e  0e               push cs                                  
  050f  e88600           call 0x598                               
  0512  83c40a           add sp, 0xa                              
  0515  9b               wait                                     
  0516  dd3e3000         fnstsw word ptr [0x30]                   
  051a  9b               wait                                     
  051b  dbe2             fnclex                                   
  051d  a13000           mov ax, word ptr [0x30]                  
  0520  243f             and al, 0x3f                             
  0522  08062400         or byte ptr [0x24], al                   
  0526  9b               wait                                     
  0527  d92c             fldcw word ptr [si]                      
  0529  f8               clc                                      
  052a  5f               pop di                                   
  052b  07               pop es                                   
  052c  5a               pop dx                                   
  052d  59               pop cx                                   
  052e  5b               pop bx                                   
  052f  5e               pop si                                   
  0530  1f               pop ds                                   
  0531  7204             jb 0x537                                 
  0533  58               pop ax                                   
  0534  58               pop ax                                   
  0535  58               pop ax                                   
  0536  cf               iret                                     
  0537  cb               retf                                     
  0538  33d2             xor dx, dx                               
  053a  8bd8             mov bx, ax                               
  053c  42               inc dx                                   
  053d  d1eb             shr bx, 1                                
  053f  73fb             jae 0x53c                                
  0541  89160800         mov word ptr [8], dx                     
  0545  b80800           mov ax, 8                                
  0548  f9               stc                                      
  0549  ebdf             jmp 0x52a                                

res_197c_054b:  ; ENTRY
  054b  9b               wait                                     
  054c  d9e5             fxam                                     
  054e  9b               wait                                     
  054f  dd3e3000         fnstsw word ptr [0x30]                   
  0553  9b               wait                                     
  0554  8a263100         mov ah, byte ptr [0x31]                  
  0558  9e               sahf                                     
  0559  7303             jae 0x55e                                
  055b  7503             jne 0x560                                
  055d  c3               ret                                      
  055e  7405             je 0x565                                 
  0560  7202             jb 0x564                                 
  0562  7b08             jnp 0x56c                                
  0564  c3               ret                                      
  0565  9b               wait                                     
  0566  ddd8             fstp st(0)                               
  0568  9b               wait                                     
  0569  d9ee             fldz                                     
  056b  c3               ret                                      
  056c  9b               wait                                     
  056d  db3e2600         fstp xword ptr [0x26]                    
  0571  9b               wait                                     
  0572  df2e2600         fild qword ptr [0x26]                    
  0576  a12e00           mov ax, word ptr [0x2e]                  
  0579  8bd0             mov dx, ax                               
  057b  80e680           and dh, 0x80                             
  057e  9b               wait                                     
  057f  db3e2600         fstp xword ptr [0x26]                    
  0583  32e6             xor ah, dh                               
  0585  9b               wait                                     
  0586  03062e00         add ax, word ptr [0x2e]                  
  058a  2d3e40           sub ax, 0x403e                           
  058d  32e6             xor ah, dh                               
  058f  a32e00           mov word ptr [0x2e], ax                  
  0592  9b               wait                                     
  0593  db2e2600         fld xword ptr [0x26]                     
  0597  c3               ret                                      

res_197c_0598:  ; ENTRY
  0598  893e0c00         mov word ptr [0xc], di                   
  059c  ba90ea           mov dx, 0xea90                           
  059f  52               push dx                                  
  05a0  8bd3             mov dx, bx                               
  05a2  80e3c0           and bl, 0xc0                             
  05a5  80fbc0           cmp bl, 0xc0                             
  05a8  7403             je 0x5ad                                 
  05aa  80ca07           or dl, 7                                 
  05ad  80ced8           or dh, 0xd8                              
  05b0  86f2             xchg dl, dh                              
  05b2  52               push dx                                  
  05b3  ba9b26           mov dx, 0x269b                           
  05b6  52               push dx                                  
  05b7  8cd2             mov dx, ss                               
  05b9  32160700         xor dl, byte ptr [7]                     
  05bd  52               push dx                                  
  05be  8bd4             mov dx, sp                               
  05c0  83c202           add dx, 2                                
  05c3  52               push dx                                  
  05c4  c45c0a           les bx, ptr [si + 0xa]                   
  05c7  cb               retf                                     
  05c8  00               db 00                                    
