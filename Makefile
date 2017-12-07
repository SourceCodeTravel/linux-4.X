include scripts/Kbuild.include

core-y		+= kernel/ mm/ fs/
vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, $(core-y)))
vmlinux-alldirs	:= $(sort $(vmlinux-dirs))

clean-dirs	:= $(addprefix _clean_, $(vmlinux-alldirs))

$(clean-dirs):
	$(MAKE) $(clean)=$(patsubst _clean_%,%,$@)

help:
	@echo  'Cleaning targets:'
	@echo  '  clean		  -'
	@echo  'Configuration targets:'

clean: $(clean-dirs)

####CK####
all:
	@echo $(clean-dirs)
	@echo '[CK]: 1' $@
