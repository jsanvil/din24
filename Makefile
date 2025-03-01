all: ud4_1 ud4_2 ud4_3 ud4_4 ud4_5 ud4_6 ud5_1 ud5_2 pr2

LOCAL_URL=http://127.0.0.1:8000/

OUTPUT_DIR=./pdf/

gettitle=$(shell grep -m 1 '# ' $1 | sed -r 's/^# //')

PREFIX=DAM_DIN_

UD1_DIR=01js/
UD2_DIR=02nodejs/
UD3_DIR=03electron/
UD4_DIR=04electron_react/
UD5_DIR=05electron_db/
PROJECTS_DIR=proyectos/

UD1_1_MD=01_electron_intro
UD1_2_MD=02_funciones

UD4_1_MD=01_intro_react
UD4_2_MD=02_electron_vite_project
UD4_3_MD=03_react_events
UD4_4_MD=04_react_state
UD4_5_MD=05_react_effect
UD4_6_MD=06_react_router_redux

UD5_1_MD=01_architecture
UD5_2_MD=02_apirest

PROJECT_2_MD=02_events

ud4_1: docs/$(UD4_DIR)$(UD4_1_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD4_DIR)$(UD4_1_MD) $(OUTPUT_DIR)$(PREFIX)4_$(UD4_1_MD).pdf "$(title)"

ud4_2: docs/$(UD4_DIR)$(UD4_2_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD4_DIR)$(UD4_2_MD) $(OUTPUT_DIR)$(PREFIX)4_$(UD4_2_MD).pdf "$(title)"

ud4_3: docs/$(UD4_DIR)$(UD4_3_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD4_DIR)$(UD4_3_MD) $(OUTPUT_DIR)$(PREFIX)4_$(UD4_3_MD).pdf "$(title)"

ud4_4: docs/$(UD4_DIR)$(UD4_4_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD4_DIR)$(UD4_4_MD) $(OUTPUT_DIR)$(PREFIX)4_$(UD4_4_MD).pdf "$(title)"

ud4_5: docs/$(UD4_DIR)$(UD4_5_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD4_DIR)$(UD4_5_MD) $(OUTPUT_DIR)$(PREFIX)4_$(UD4_5_MD).pdf "$(title)"

ud4_6: docs/$(UD4_DIR)$(UD4_6_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD4_DIR)$(UD4_6_MD) $(OUTPUT_DIR)$(PREFIX)4_$(UD4_6_MD).pdf "$(title)"

ud5_1: docs/$(UD5_DIR)$(UD5_1_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD5_DIR)$(UD5_1_MD) $(OUTPUT_DIR)$(PREFIX)5_$(UD5_1_MD).pdf "$(title)"

ud5_2: docs/$(UD5_DIR)$(UD5_2_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD5_DIR)$(UD5_2_MD) $(OUTPUT_DIR)$(PREFIX)5_$(UD5_2_MD).pdf "$(title)"

pr2: docs/$(PROJECTS_DIR)$(PROJECT_2_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(PROJECTS_DIR)$(PROJECT_2_MD) $(OUTPUT_DIR)$(PREFIX)PROJECT_$(PROJECT_2_MD).pdf "$(title)"

clean:
	rm $(OUTPUT_DIR)*
