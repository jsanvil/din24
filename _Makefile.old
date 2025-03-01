all: entorno ud1 ud2_1 ud2_2 ud2_3 ud3_1 ud3_2 ud4_1 ud4_2 ud4_3 ud4_4 ud4_5 ud5_1 ud5_2 ud5_3 ud5_4

.PHONY: entorno ud1 ud2_1 ud2_2 ud2_3 ud3_1 ud3_2 ud4_1 ud4_2 ud4_3 ud4_4 ud4_5 ud5_1 ud5_2 ud5_3 ud5_4

VENV=.venv
VENV_PYTHON=$(VENV)/bin/python
SYSTEM_PYTHON=$(or $(shell which python3), $(shell which python))
PYTHON=$(or $(wildcard $(VENV_PYTHON)), $(SYSTEM_PYTHON))

$(VENV_PYTHON):
	rm -rf $(VENV)
	$(SYSTEM_PYTHON) -m venv $(VENV)

venv: $(VENV_PYTHON)

deps:
	##$(PYTHON) -m pip install --upgrade pip
	# Dev dependencies
	$(PYTHON) -m pip install mkdocs-material
    # Dependencies
	# $(PYTHON) setup.py develop

serve:
	. $(VENV)/bin/activate && mkdocs serve

deploy:
	. $(VENV)/bin/activate && mkdocs gh-deploy

pdf:
	. $(VENV)/bin/activate && mkdocs serve&
	make all

.PHONY: venv deps serve deploy pdf

LOCAL_URL=http://127.0.0.1:8000/

OUTPUT_DIR=pdf/
DOCS_DIR=docs/

gettitle=$(shell grep -m 1 '# ' $1 | sed -r 's/^# //')

entorno: $(OUTPUT_DIR)entorno.pdf
./pdf/entorno.pdf: docs/entorno.md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)entorno $(OUTPUT_DIR)entorno.pdf "$(title)"

# -------- UD1 --------

UD1_DIR=ud1/

UD1=ud1_intro
UD1_MD=$(UD1_DIR)$(UD1)

ud1: $(OUTPUT_DIR)$(UD1).pdf
$(OUTPUT_DIR)$(UD1).pdf: $(DOCS_DIR)$(UD1_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD1_MD) $(OUTPUT_DIR)$(UD1).pdf "$(title)"

# -------- UD2 --------

UD2_DIR=ud2/

UD2_1=ud2_1_electron_requisitos
UD2_1_MD=$(UD2_DIR)$(UD2_1)

ud2_1: $(OUTPUT_DIR)$(UD2_1).pdf
$(OUTPUT_DIR)$(UD2_1).pdf: $(DOCS_DIR)$(UD2_1_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD2_1_MD) $(OUTPUT_DIR)$(UD2_1).pdf "$(title)"

UD2_2=ud2_2_primera_app
UD2_2_MD=$(UD2_DIR)$(UD2_2)

ud2_2: $(OUTPUT_DIR)$(UD2_2).pdf
$(OUTPUT_DIR)$(UD2_2).pdf: $(DOCS_DIR)$(UD2_2_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD2_2_MD) $(OUTPUT_DIR)$(UD2_2).pdf "$(title)"

UD2_3=ud2_3_maquetacion
UD2_3_MD=$(UD2_DIR)$(UD2_3)

ud2_3: $(OUTPUT_DIR)$(UD2_3).pdf
$(OUTPUT_DIR)$(UD2_3).pdf: $(DOCS_DIR)$(UD2_3_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD2_3_MD) $(OUTPUT_DIR)$(UD2_3).pdf "$(title)"

# -------- UD3 --------

UD3_DIR=ud3/

UD3_1=ud3_1_componentes_basicos
UD3_1_MD=$(UD3_DIR)$(UD3_1)

ud3_1: $(OUTPUT_DIR)$(UD3_1).pdf
$(OUTPUT_DIR)$(UD3_1).pdf: $(DOCS_DIR)$(UD3_1_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD3_1_MD) $(OUTPUT_DIR)$(UD3_1).pdf "$(title)"

UD3_2=ud3_2_electron_procesos
UD3_2_MD=$(UD3_DIR)$(UD3_2)

ud3_2: $(OUTPUT_DIR)$(UD3_2).pdf
$(OUTPUT_DIR)$(UD3_2).pdf: $(DOCS_DIR)$(UD3_2_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD3_2_MD) $(OUTPUT_DIR)$(UD3_2).pdf "$(title)"

# -------- UD4 --------

UD4_DIR=ud4/

UD4_1=ud4_1_componentes_avanzados
UD4_1_MD=$(UD4_DIR)$(UD4_1)

ud4_1: $(OUTPUT_DIR)$(UD4_1).pdf
$(OUTPUT_DIR)$(UD4_1).pdf: $(DOCS_DIR)$(UD4_1_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD4_1_MD) $(OUTPUT_DIR)$(UD4_1).pdf "$(title)"

UD4_2=ud4_2_electron_react
UD4_2_MD=$(UD4_DIR)$(UD4_2)

ud4_2: $(OUTPUT_DIR)$(UD4_2).pdf
$(OUTPUT_DIR)$(UD4_2).pdf: $(DOCS_DIR)$(UD4_2_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD4_2_MD) $(OUTPUT_DIR)$(UD4_2).pdf "$(title)"

UD4_3=ud4_3_react-eventos-estados
UD4_3_MD=$(UD4_DIR)$(UD4_3)

ud4_3: $(OUTPUT_DIR)$(UD4_3).pdf
$(OUTPUT_DIR)$(UD4_3).pdf: $(DOCS_DIR)$(UD4_3_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD4_3_MD) $(OUTPUT_DIR)$(UD4_3).pdf "$(title)"


UD4_4=ud4_4_route-store
UD4_4_MD=$(UD4_DIR)$(UD4_4)

ud4_4: $(OUTPUT_DIR)$(UD4_4).pdf
$(OUTPUT_DIR)$(UD4_4).pdf: $(DOCS_DIR)$(UD4_4_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD4_4_MD) $(OUTPUT_DIR)$(UD4_4).pdf "$(title)"


UD4_5=ud4_5_example
UD4_5_MD=$(UD4_DIR)$(UD4_5)

ud4_5: $(OUTPUT_DIR)$(UD4_5).pdf
$(OUTPUT_DIR)$(UD4_5).pdf: $(DOCS_DIR)$(UD4_5_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD4_5_MD) $(OUTPUT_DIR)$(UD4_5).pdf "$(title)"

# -------- UD5 --------

UD5_DIR=ud5/

UD5_1=ud5_1_usabilidad
UD5_1_MD=$(UD5_DIR)$(UD5_1)

ud5_1: $(OUTPUT_DIR)$(UD5_1).pdf
$(OUTPUT_DIR)$(UD5_1).pdf: $(DOCS_DIR)$(UD5_1_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD5_1_MD) $(OUTPUT_DIR)$(UD5_1).pdf "$(title)"

UD5_2=ud5_2_flutter_intro
UD5_2_MD=$(UD5_DIR)$(UD5_2)

ud5_2: $(OUTPUT_DIR)$(UD5_2).pdf
$(OUTPUT_DIR)$(UD5_2).pdf: $(DOCS_DIR)$(UD5_2_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD5_2_MD) $(OUTPUT_DIR)$(UD5_2).pdf "$(title)"

UD5_3=ud5_3_flutter_layout
UD5_3_MD=$(UD5_DIR)$(UD5_3)

ud5_3: $(OUTPUT_DIR)$(UD5_3).pdf
$(OUTPUT_DIR)$(UD5_3).pdf: $(DOCS_DIR)$(UD5_3_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD5_3_MD) $(OUTPUT_DIR)$(UD5_3).pdf "$(title)"

UD5_4=ud5_4_flutter_state
UD5_4_MD=$(UD5_DIR)$(UD5_4)

ud5_4: $(OUTPUT_DIR)$(UD5_4).pdf
$(OUTPUT_DIR)$(UD5_4).pdf: $(DOCS_DIR)$(UD5_4_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD5_4_MD) $(OUTPUT_DIR)$(UD5_4).pdf "$(title)"

UD5_5=ud5_5_flutter_navigation
UD5_5_MD=$(UD5_DIR)$(UD5_5)

ud5_5: $(OUTPUT_DIR)$(UD5_5).pdf
$(OUTPUT_DIR)$(UD5_5).pdf: $(DOCS_DIR)$(UD5_5_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD5_5_MD) $(OUTPUT_DIR)$(UD5_5).pdf "$(title)"

UD5_6=ud5_6_flutter_persistence
UD5_6_MD=$(UD5_DIR)$(UD5_6)

ud5_6: $(OUTPUT_DIR)$(UD5_6).pdf
$(OUTPUT_DIR)$(UD5_6).pdf: $(DOCS_DIR)$(UD5_6_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD5_6_MD) $(OUTPUT_DIR)$(UD5_6).pdf "$(title)"

UD5_7=ud5_7_flutter_http
UD5_7_MD=$(UD5_DIR)$(UD5_7)

ud5_7: $(OUTPUT_DIR)$(UD5_7).pdf
$(OUTPUT_DIR)$(UD5_7).pdf: $(DOCS_DIR)$(UD5_7_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(UD5_7_MD) $(OUTPUT_DIR)$(UD5_7).pdf "$(title)"

# -------- proyectos --------

PR_EV2=proyecto2ev
PR_EV2_MD=proyectos/$(PR_EV2)

pr_ev2: $(OUTPUT_DIR)$(PR_EV2).pdf
$(OUTPUT_DIR)$(PR_EV2).pdf: $(DOCS_DIR)$(PR_EV2_MD).md
	$(eval title := $(call gettitle, $<) )
	node exportpdf.js $(LOCAL_URL)$(PR_EV2_MD) $(OUTPUT_DIR)$(PR_EV2).pdf "$(title)"

clean:
	rm $(OUTPUT_DIR)*

venv/bin/activate:
	python3 -m venv venv
