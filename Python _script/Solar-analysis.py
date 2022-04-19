import PySimpleGUI as sg
import numpy as np
from PIL import Image
from matplotlib import cm
from matplotlib.pyplot import imshow, show, colorbar, imsave

sg.theme('Default1')  # please make your windows colorful

divisions = {
    '2 hours': 1 / 2,
    '1.5 hour': 2 / 3,
    'hour': 1,
    '30 min': 2,
    '20 min': 3,
    '15 min': 4,
    '10 min': 6
}
image_1 = b'iVBORw0KGgoAAAANSUhEUgAAAj0AAABnCAYAAADrG/O5AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAFF2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNy4xLWMwMDAgNzkuN2E3YTIzNiwgMjAyMS8wOC8xMi0wMDoyNToyMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0RXZ0PSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VFdmVudCMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDIyLjUgKFdpbmRvd3MpIiB4bXA6Q3JlYXRlRGF0ZT0iMjAyMi0wMy0wOFQxMzoxMTozMiswMTowMCIgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMDhUMTM6NDg6MTcrMDE6MDAiIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMDhUMTM6NDg6MTcrMDE6MDAiIGRjOmZvcm1hdD0iaW1hZ2UvcG5nIiBwaG90b3Nob3A6Q29sb3JNb2RlPSIzIiBwaG90b3Nob3A6SUNDUHJvZmlsZT0ic1JHQiBJRUM2MTk2Ni0yLjEiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NGE3YzNhZTItNTZlOS0w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'

layout = [
    [sg.Text('Parameters:', font=("Helvetica", 13))],
    [sg.Column([[sg.Text('IN:', font=("Helvetica", 11))],
                [sg.Button('Select images', key='Select')],
                [sg.Text('Simulation time shots every', tooltip='The time parameter set in the 3d program')],
                ]),
     sg.Column([[sg.Text('', font=("Helvetica", 11))],
                [sg.Text('selected:'), sg.Text('0', key='num_images')],
                [sg.Combo(list(divisions.keys()), default_value='hour', key='shots_ph')],
                ]),
     sg.Column([[sg.Text('OUT:', font=("Helvetica", 11))],
                [sg.Text('Color every', tooltip='Time between color-changes')],
                [sg.Text('Color gradient')]
                ]),
     sg.Column([[sg.Text('', font=("Helvetica", 11))],
                [sg.Combo(list(divisions.keys()), default_value='hour', key='colors_ph')],
                [sg.Combo(['viridis', 'plasma', 'inferno', 'magma', 'cividis', 'GnBu', 'terrain', 'rainbow', 'summer',
                           'gist_earth', 'ocean', 'Greys'], default_value='viridis', key='cm_name')]
                ])
     ],
    [sg.Image(image_1)],
    [sg.Slider(orientation='horizontal', key='stSlider', range=(-1, 255), default_value=250),
     # sg.Text("black <"),
     # sg.Input(key='stVal', size=(3, 1)),
     # sg.Input(key='enVal', size=(3, 1)),
     # sg.Text("<white"),
     sg.Slider(orientation='horizontal', key='endSlider', range=(-1, 255), default_value=10)],
    [sg.Submit(), sg.Exit()],
]

window = sg.Window('Shadow analysis', layout)

while True:  # Event Loop
    event, values = window.read()

    # closing window
    if event == sg.WIN_CLOSED or event == 'Exit':
        break

    # selecting files
    if event == 'Select':
        img_dir = sg.popup_get_file('Pick images', multiple_files=True)
        img_dir = img_dir.split(';')
        img_len = len(img_dir)
        window['num_images'].update(str(img_len))

    # go go gooo
    if event == 'Submit':

        # Get images, convert to numpy Black and White
        img = [Image.open(a).convert("L") for a in img_dir]
        img_data = [np.asarray(a) for a in img]

        # weight
        w = 1 / divisions[values['shots_ph']]

        t1 = int(values['stSlider'])  # threshold 1
        img_bin = [np.where(a > t1, w, 0) for a in img_data]

        # summation
        shape = img_bin[0].shape
        img_comb, count = np.zeros(shape, dtype=int), 0

        for img in img_bin:
            img_comb = np.add(img_comb, img)
            count += 1

        # subtract lines
        t2 = int(values['endSlider'])  # threshold 2
        img_lines = np.where(img_data[0] > t2, 0, 25)
        img_comb = np.subtract(img_comb, img_lines)
        top = np.amax(img_comb)

        # own colormap

        my_cm = cm.get_cmap(values['cm_name'], int(img_len * w * divisions[values['colors_ph']]))
        my_cm.set_under('black')

        # mathplot
        imshow(img_comb, cmap=my_cm, vmin=-w/2, vmax = top - w/2)
        # vmax = count - 0.5
        imsave("C:/Users/phili/OneDrive/Bureau/lol.png", img_comb,  cmap=my_cm, vmin=-w/2, vmax = top - w/2)
        colorbar()
        show()

window.close()
