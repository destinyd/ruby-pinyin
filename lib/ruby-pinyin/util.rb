# -*- coding: utf-8 -*-

module PinYin
  module Util
    extend self

    ASCIIMapping = {
      'üē' => ['ue', 1], 'üé' => ['ue', 2], 'üě' => ['ue', 3], 'üè' => ['ue', 4], 'üe' => ['ue', 5], 'hm' => ['hm', ''], 'hnm' => ['hnm', ''],
      'ā' => ['a', 1], 'ē' => ['e', 1], 'ê̄' => ['ee', 1], 'ī' => ['i', 1], 'ō' => ['o', 1], 'ū' => ['u', 1], 'ǖ' => ['v', 1], 'm̄' => ['m', 1], 'n̄' => ['n', 1],
      'á' => ['a', 2], 'é' => ['e', 2], 'ế' => ['ee', 2], 'í' => ['i', 2], 'ó' => ['o', 2], 'ú' => ['u', 2], 'ǘ' => ['v', 2], 'ḿ' => ['m', 2], 'ń' => ['n', 2],
      'ǎ' => ['a', 3], 'ě' => ['e', 3], 'ê̌' => ['ee', 3], 'ǐ' => ['i', 3], 'ǒ' => ['o', 3], 'ǔ' => ['u', 3], 'ǚ' => ['v', 3], 'm̌' => ['m', 3], 'ň' => ['n', 3],
      'à' => ['a', 4], 'è' => ['e', 4], 'ề' => ['ee', 4], 'ì' => ['i', 4], 'ò' => ['o', 4], 'ù' => ['u', 4], 'ǜ' => ['v', 4], 'm̀' => ['m', 4], 'ǹ' => ['n', 4],
      /^lü$/ => ['lv', 5], /^nü$/ => ['nv', 5],
    }

    def to_ascii(reading, with_tone=true)
      ASCIIMapping.each do |char, (ascii, tone)|
        if reading.match char
          if with_tone
            return reading.sub(char, ascii).concat(tone.to_s)
          else
            return reading.sub(char, ascii)
          end
        end
      end
      return reading.concat("5") if with_tone # 找不到带声调的拼音字母说明是轻声，用数字5表示
      reading
    end

  end
end
