import 'package:app_attendance_record/app/ui/utils/style_utils.dart';
import 'package:flutter/material.dart';

enum TypeComparison { PRUEBAS, TEMARIO }

class SingleChoice extends StatefulWidget {
  final void Function(String) onChanged;

  const SingleChoice({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  TypeComparison typeView = TypeComparison.PRUEBAS;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<TypeComparison>(
      segments: const <ButtonSegment<TypeComparison>>[
        ButtonSegment<TypeComparison>(
          value: TypeComparison.PRUEBAS,
          label: Text('Asistencia'),
          icon: Icon(Icons.calendar_view_day_outlined),
        ),
        ButtonSegment<TypeComparison>(
          value: TypeComparison.TEMARIO,
          label: Text('Actividades'),
          icon: Icon(Icons.category),
        ),
        ButtonSegment<TypeComparison>(
          value: TypeComparison.TEMARIO,
          label: Text('Plan de estudio'),
          icon: Icon(Icons.category),
        ),
        ButtonSegment<TypeComparison>(
          value: TypeComparison.TEMARIO,
          label: Text('Tareas'),
          icon: Icon(Icons.category),
        ),
      ],
      selected: <TypeComparison>{typeView},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              // Color cuando el botón está seleccionado
              return SECONDARY_LIGHT; // Puedes cambiar a tu color personalizado
            }
            // Color cuando el botón no está seleccionado
            return Colors.white; // Puedes cambiar a tu color personalizado
          },
        ),
      ),
      onSelectionChanged: (Set<TypeComparison> newSelection) {
        setState(() {
          typeView = newSelection.first;
          widget.onChanged(typeView.toString().split('.').last);
        });
      },
    );
  }
}
