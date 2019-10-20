import { score } from '../src';

describe('scrabblescore', () => {
  it('calculates the correct score for a word', async () => {
    const result = await score('oxyphenbutazone');
    expect(result).toBe(41);
  });
});
