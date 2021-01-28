import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BlockAvailableComponent } from './block-available.component';

describe('BlockAvailableComponent', () => {
  let component: BlockAvailableComponent;
  let fixture: ComponentFixture<BlockAvailableComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ BlockAvailableComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(BlockAvailableComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
