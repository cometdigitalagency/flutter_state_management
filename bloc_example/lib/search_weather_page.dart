import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/weather_bloc.dart';

class SearchWeatherPage extends StatelessWidget {
  const SearchWeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather search'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: BlocConsumer<WeatherBloc, WeatherState>(
              listener: (context, state) {
            if (state.status == WeatherStateStatus.failure) {
              final snackBar = SnackBar(
                content: Text(state.errorMessage ?? ''),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }, builder: (context, state) {
            if (state.status == WeatherStateStatus.loading) {
              return const CircularProgressIndicator();
            } else if (state.status == WeatherStateStatus.success) {
              return Column(
                children: [
                  Text(
                    state.weather?.cityName ?? '',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${state.weather?.temperature}',
                    style: const TextStyle(fontSize: 80),
                  ),
                  const SizedBox(height: 20),
                  const CityInputField(),
                ],
              );
            } else {
              return const CityInputField();
            }
          }),
        ));
  }
}

class CityInputField extends StatelessWidget {
  const CityInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) {
          context.read<WeatherBloc>().add(GetWeather(cityName: value));
          context.read<WeatherBloc>().add(GetWeather(cityName: value));
        },
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a city",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
