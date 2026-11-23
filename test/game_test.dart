import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_tank_savasi/oyun_tank_savasi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(tankConfig.title.length, 33);
    expect(tankConfig.tagline.length, 33);
    for (final s in tankConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(tankGameRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: tankId, optionalMechanics: tankGameRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(tankGameRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
