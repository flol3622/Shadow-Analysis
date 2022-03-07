import PySimpleGUI as sg
import numpy as np

from matplotlib.pyplot import imshow, show, colorbar
from matplotlib import cm
from PIL import Image

sg.theme('Default1')  # please make your windows colorful

divisions = {
    'hour': 1,
    '30 min': 2,
    '20 min': 3,
    '15 min': 4,
    '10 min': 6
}

layout = [[sg.Text('Parameters:', font=("Helvetica", 13))],
          [sg.Button('Select images', key='Select'), sg.Text('selected:'), sg.Text('0', key='num_images')],
          [sg.Text('Simulation time shots every', tooltip='The time parameter set in the 3d program'),
           sg.Combo(['hour', '30 min', '20 min', '15 min', '10 min'], default_value='hour', key='shots_ph')],
          [sg.Text('Color gradient'),
           sg.Combo(['viridis', 'plasma', 'inferno', 'magma', 'cividis'], default_value='viridis', key='cm_name')],
          [sg.Submit(), sg.Exit()]]

window = sg.Window('Shadow analysis', layout)

while True:  # Event Loop
    event, values = window.read()
    print(event, values)

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
        w = 1/divisions[values['shots_ph']]

        t1 = 200  # threshold 1
        img_bin = [np.where(a > t1, w, 0) for a in img_data]

        # summation
        shape = img_bin[0].shape
        img_comb, count = np.zeros(shape, dtype=int), 0
        print(img_comb)

        for img in img_bin:
            img_comb = np.add(img_comb, img)
            count += 1
            print(count)

        # subtract lines
        t2 = 100  # threshold 2
        img_lines = np.where(img_data[0] > t2, 0, 25)
        img_comb = np.subtract(img_comb, img_lines)

        # own colormap
        my_cm = cm.get_cmap(values['cm_name'], img_len)
        my_cm.set_under('black')

        # mathplot
        result = imshow(img_comb, cmap=my_cm, vmin=0)
        colorbar()
        show()

window.close()






