import vtk
import numpy
import sys


#Reader apontado no diretorio das imagens DICOM
# reader = vtk.vtkDICOMImageReader()
# reader.SetDataByteOrderToLittleEndian()
# reader.SetDirectoryName('digest_article')
# reader.SetDataSpacing(3.2, 3.2, 1.5)
# reader.Update();

reader = vtk.vtkNIFTIImageReader()
reader.SetFileName('my_nii2.nii')

# reader = vtk.vtkJPEGReader()
# reader.SetFileName('image-00000.jpg')

#Fazer MarchingCubes com a serie DICOM
march = vtk.vtkMarchingCubes()
march.SetInputConnection(reader.GetOutputPort())
march.SetValue(0,1)
# 0,80
marchstripper = vtk.vtkStripper()
marchstripper.SetInputConnection(march.GetOutputPort())

# Criação do mapper para a malha de reconstrução
mapper = vtk.vtkPolyDataMapper()
mapper.SetInputConnection(marchstripper.GetOutputPort())
mapper.ScalarVisibilityOff()

# visualização de imagens DICOM
# imageViewer = vtk.vtkImageViewer2()
# imageViewer.SetInputConnection(reader.GetOutputPort())

# Aponta um actor para o mapper da malha
actor = vtk.vtkActor()
actor.SetMapper(mapper)
actor.GetProperty().SetRepresentationToWireframe()

# Escreve .vtk
# writer = vtk.vtkPolyDataWriter()
# writer.SetInputData(march.GetOutput())
# writer.SetFileName('myrecon.vtk')
# writer.Update()

# Criação do render
renderer = vtk.vtkRenderer()
renderer.AddActor(actor)
renderer.ResetCamera()
renderer.SetBackground(0.0, 0.0, 0.0)

# Criação da janela
renderer_window = vtk.vtkRenderWindow()
renderer_window.AddRenderer(renderer)
renderer_window.SetWindowName('ReadImageData')

# Criação do interador
interactor = vtk.vtkRenderWindowInteractor()
interactor.SetRenderWindow(renderer_window)
interactor.Initialize()
interactor.Start()

