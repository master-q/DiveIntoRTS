## For amd64

## Debug for STG machine
define stg_startup
  break ZCMain_main_info
  run +RTS -V0
end

define stg_step
  run_until_call_jmp
  stepi
end

## Copy from http://www.ginriki.net/wd/2008/12/03/48/
define run_until_call_jmp
  is_call
  is_jmp
  while !($is_call_op || $is_jmp_op)
    stepi
    is_call
    is_jmp
  end
end

define is_jmp
  set $_op1 = *(unsigned char*)($rip + 0)
  set $_op2 = *(unsigned char*)($rip + 1)
  set $is_jmp_op = 0

  if ($_op1 == 0xEB) || ($_op1 == 0xE9) || ($_op1 == 0xEA)
    set $is_jmp_op = 1
  end

  if ($_op1 == 0xFF) && (($_op2 & 0x07) == 4 || ($_op2 & 0x07) == 5)
    set $is_jmp_op = 1
  end

end

define is_call
  set $_op1 = *(unsigned char*)($rip + 0)
  set $_op2 = *(unsigned char*)($rip + 1)
  set $is_call_op = 0

  if ($_op1 == 0xE8) || ($_op1 == 0x9A)
    set $is_call_op = 1
  end

  if ($_op1 == 0xFF) && (($_op2 & 0x07) == 2 || ($_op2 & 0x07) == 3)
    set $is_call_op = 1
  end
end

## Copy from http://hackage.haskell.org/trac/ghc/wiki/Debugging/CompiledCode
# Change $r13 to whatever BaseReg is mapped to
define pregs
print *(StgRegTable *)$r13
end

define ptso
print *((StgRegTable*)$r13)->rCurrentTSO
end

define pR1
print (((StgRegTable)MainRegTable).rR1)
end
define pR2
print (((StgRegTable)MainRegTable).rR2)
end
define pR3
print (((StgRegTable)MainRegTable).rR3)
end
define pR4
print (((StgRegTable)MainRegTable).rR4)
end
define pR5
print (((StgRegTable)MainRegTable).rR5)
end
define pR6
print (((StgRegTable)MainRegTable).rR6)
end
define pR7
print (((StgRegTable)MainRegTable).rR7)
end
define pR8
print (((StgRegTable)MainRegTable).rR8)
end
define pFlt1
print (StgFloat) (((StgRegTable)MainRegTable).rFlt1)
end
define pDbl1
print (StgDouble) (((StgRegTable)MainRegTable).rDbl1)
end

define pSp
print (((StgRegTable)MainRegTable).rSp)
end
define pSu
print (((StgRegTable)MainRegTable).rSu)
end
define pSpLim
print (((StgRegTable)MainRegTable).rSpLim)
end

define pHp
print (((StgRegTable)MainRegTable).rHp)
end
define pHpLim
print (((StgRegTable)MainRegTable).rHpLim)
end

# Change $rbp to whatever Sp is mapped to
define pstk
pmem $ebp 16
end

define pstk_gc
pmem MainTSO->sp 16
end

define pmem
set $i = $arg1
set $mem = ((unsigned long)$arg0) & (sizeof(void*)==8 ? ~7 : ~3)
while $i > 0
set $i = $i - 1
x/1a (((long *)$mem) +$i)
end
end

define p4
pmem $arg0 4
end

define p8
pmem $arg0 8
end

define p16
pmem $arg0 16
end

define pmem_forwards
set $mem = $arg0 & (sizeof(void*)==8 ? ~7 : ~3)
set $i = 0
while $i < $arg1
x/1a (((int *)$mem) + $i)
set $i = $i + 1
end
end

define pheap
pmem $edi-16 16
end

define dpc
display /i $pc
end

define pinfo
p *((StgInfoTable *)$arg0-1)
end

define pcinfo
p *((StgConInfoTable *)$arg0-1)
end

define prinfo
p *((StgRetInfoTable *)$arg0-1)
end

define pfinfo
p *((StgFunInfoTable *)$arg0-1)
end

define pbd
p sizeof(void *)==8 ? (* ((bdescr *)((($arg0 & 0xfffffffffff00000) | (($arg0 & 0xff000) >> 6)) & 0xffffffffffffffc0))) : * ((bdescr *)((($arg0 & 0xfff00000) | (($arg0 & 0xff000) >> 7)) & 0xffffffe0))
end

define pgen
p generations[((bdescr *)((($arg0 & 0xfff00000) | (($arg0 & 0xff000) >> 7)) & 0xffffffe0))->gen_no]
p * ((bdescr *)((($arg0 & 0xfff00000) | (($arg0 & 0xff000) >> 7)) & 0xffffffe0))->step
end

define getmark
set $bd = (bdescr *)((($arg0 & 0xfff00000) | (($arg0 & 0xff000) >> 7)) & 0xffffffe0)
set $offset = (StgPtr)$arg0 - $bd->start
set $bitmap_word = $bd->u.bitmap + ($offset / 32)
set $mask = 1 << ($offset & 31)
p (*$bitmap_word & $mask) != 0
end

define getmark64
set $bd = (bdescr *)((($arg0 & 0xfffffffffff00000) | (($arg0 & 0xff000) >> 6)) & 0xffffffffffffffc0)
set $offset = (StgPtr)$arg0 - $bd->start
set $bitmap_word = $bd->u.bitmap + ($offset / 64)
set $mask = 1 << ($offset & 63)
p (*$bitmap_word & $mask) != 0
end

# ignore SIGPIPEs
handle SIGPIPE nostop noprint ignore

define debug1
p RtsFlags.DebugFlags.interpreter=1
p RtsFlags.DebugFlags.apply=1
p RtsFlags.DebugFlags.sanity=1
end

define debug2
p RtsFlags.DebugFlags.interpreter=1
p RtsFlags.DebugFlags.sanity=1
end

define sanity
p RtsFlags.DebugFlags.sanity=1
end

define srch
print findPtr($1,0)
end
define chain
print findPtr($1,1)
end
